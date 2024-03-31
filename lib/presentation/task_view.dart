import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/methods/data_source.dart';
// import 'package:nn/methods/evt_type_dropdown.dart';

class TaskView extends StatefulWidget{
  final Appointment? appointment;
  
  const TaskView({super.key, required this.appointment});

  @override
  State<TaskView> createState() => _TaskViewState(appointment: appointment);
}

// List<Color> _colorCollection = <Color>[];
// List<String> _colorNames = <String>[];
// int _selectedColorIndex = 0;
// int _selectedTypeIndex = 0;
// List<String> _typeCollection = <String>[];

class _TaskViewState extends State<TaskView> {

  Appointment? appointment;
  _TaskViewState({required this.appointment});

  late DateTime   _startDate, _endDate;
  late TimeOfDay  _startTime, _endTime;
  late bool       _isAllDay;
  late String     _subject, _notes;
  late DataSource _events;
  late Color      _color;

  @override
  void initState(){
    _startDate = appointment!.startTime;
    _startTime = TimeOfDay.fromDateTime(appointment!.startTime);
    _endDate =   appointment!.endTime;
    _endTime =   TimeOfDay.fromDateTime(appointment!.endTime);
    _isAllDay =  appointment!.isAllDay;
    _subject =   appointment!.subject;
    _notes =     appointment!.notes.toString();
    _events =    DataSource(getDataSource());
    _color =     appointment!.color;
    print(_events);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(getTile()),
              backgroundColor: const Color(0xffF5F5F5),
              leading: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    icon: const Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    onPressed: () { // Add the edited event to the list of appointments
                      final List<Appointment> meetings = <Appointment>[];

                      // If appointment object exists, remove from data source
                      if (appointment != null) {
                        _events.appointments!.removeAt(_events.appointments!.indexOf(appointment)); 
                        _events.notifyListeners(CalendarDataSourceAction.remove, 
                          <Appointment>[]..add(appointment!));
                      }

                      // Create new appointment object
                      meetings.add(Appointment(
                        startTime: _startDate,
                        endTime:   _endDate,
                        color:     _color,
                        notes:     _notes,
                        isAllDay:  _isAllDay,
                        subject:   _subject == '' ? '(No title)' : _subject,
                        // startTimeZone: _selectedTimeZoneIndex == 0
                        //     ? ''
                        //     : _timeZoneCollection[_selectedTimeZoneIndex],
                        // endTimeZone: _selectedTypeIndex == 0
                        //     ? ''
                        //     : _typeCollection[_selectedTypeIndex],
                      ));

                      // Add the appointment object to the data source object
                      _events.appointments!.add(meetings[0]);

                      // Add appointment object to actual data source.
                      _events.notifyListeners(
                          CalendarDataSourceAction.add, meetings);

                      appointment = null;

                      Navigator.pop(context);
                    })
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Stack(
                children: <Widget>[_getAppointmentEditor(context)],
              ),
            ),
            floatingActionButton: appointment == null
                ? const Text('')
                : FloatingActionButton(
                    onPressed: () { // Delete appointment
                      if (appointment != null) {
                        _events.appointments!.removeAt(_events.appointments!.indexOf(appointment));
                        
                        _events.notifyListeners(CalendarDataSourceAction.remove,
                            <Appointment>[]..add(appointment!));
                        
                        appointment = null;
                        
                        Navigator.pop(context);
                      }
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.delete_outline, color: Colors.white),
                  )));
  }

  String getTile() {
    return _subject.isEmpty ? 'New event' : 'Event details';
  }

  Widget _getAppointmentEditor(BuildContext context) {
  return Container(
    color: Colors.white,
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[

          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            leading: const Text(''),
            title: TextField(
              controller: TextEditingController(text: appointment!.subject),
              onChanged: (String value) {
                _subject = value;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Add title',
              ),
            ),
          ),
          
          const Divider(
            height: 1.0,
            thickness: 1,
          ),

          // ListTile(
          //   contentPadding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          //   leading: const Icon(
          //     Icons.access_time,
          //     color: Colors.black54,
          //   ),
          //   title: Row(children: <Widget>[
          //     const Expanded(
          //       child: Text('All-day'),
          //     ),
          //     Expanded(
          //       child: Align(
          //         alignment: Alignment.centerRight,
          //         child: Switch(
          //           value: _isAllDay,
          //           onChanged: (bool value) {
          //             setState(() {
          //               _isAllDay = value;
          //             });
          //           },
          //         )
          //       )
          //     )
          //   ])
          // ),

          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
            leading: const Text(''),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    child: Text(
                      DateFormat('EEE, MMM dd yyyy').format(_startDate),
                      textAlign: TextAlign.left
                    ),
                    onTap: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: _startDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)
                      );

                      if (date != null && date != _startDate) {
                        setState(() {
                          final Duration difference = _endDate.difference(_startDate);
                          _startDate = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            _startTime.hour,
                            _startTime.minute,
                            0
                          );
                          _endDate = _startDate.add(difference);
                          _endTime = TimeOfDay(
                            hour: _endDate.hour,
                            minute: _endDate.minute
                          );
                        });
                      }
                    }
                  )
                ),
                Expanded(
                  flex: 3,
                  child: _isAllDay
                    ? const Text('')
                    : GestureDetector(
                        child: Text(
                          DateFormat('hh:mm a').format(_startDate),
                          textAlign: TextAlign.right
                        ),
                        onTap: () async {
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: _startTime.hour,
                              minute: _startTime.minute
                            )
                          );

                          if (time != null && time != _startTime) {
                            setState(() {
                              _startTime = time;
                              final Duration difference = _endDate.difference(_startDate);
                              _startDate = DateTime(
                                _startDate.year,
                                _startDate.month,
                                _startDate.day,
                                _startTime.hour,
                                _startTime.minute,
                                0
                              );
                              _endDate = _startDate.add(difference);
                              _endTime = TimeOfDay(
                                hour: _endDate.hour,
                                minute: _endDate.minute
                              );
                            });
                          }
                        }
                      )
                )
              ]
            )
          ),



          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
            leading: const Text(''),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    child: Text(
                      DateFormat('EEE, MMM dd yyyy').format(_endDate),
                      textAlign: TextAlign.left
                    ),
                    onTap: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: _endDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)
                      );

                      if (date != null && date != _endDate) {
                        setState(() {
                          final Duration difference = _endDate.difference(_startDate);
                          _endDate = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            _endTime.hour,
                            _endTime.minute,
                            0
                          );
                          if (_endDate.isBefore(_startDate)) {
                            _startDate = _endDate.subtract(difference);
                            _startTime = TimeOfDay(
                              hour: _startDate.hour,
                              minute: _startDate.minute
                            );
                          }
                        });
                      }
                    }
                  )
                ),
                Expanded(
                  flex: 3,
                  child: _isAllDay
                    ? const Text('')
                    : GestureDetector(
                        child: Text(
                          DateFormat('hh:mm a').format(_endDate),
                          textAlign: TextAlign.right
                        ),
                        onTap: () async {
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: _endTime.hour,
                              minute: _endTime.minute
                            )
                          );

                          if (time != null && time != _endTime) {
                            setState(() {
                              _endTime = time;
                              final Duration difference = _endDate.difference(_startDate);
                              _endDate = DateTime(
                                _endDate.year,
                                _endDate.month,
                                _endDate.day,
                                _endTime.hour,
                                _endTime.minute,
                                0
                              );
                              if (_endDate.isBefore(_startDate)) {
                                _startDate = _endDate.subtract(difference);
                                _startTime = TimeOfDay(
                                  hour: _startDate.hour,
                                  minute: _startDate.minute
                                );
                              }
                            });
                          }
                        }
                      )
                )
              ]
            )
          ),

          // ListTile(
          //   contentPadding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          //   leading: const Icon(
          //     Icons.public,
          //     color: Colors.black87,
          //   ),
          //   title: Text(_typeCollection[_selectedTypeIndex]),
          //   onTap: () {
          //     showDialog<Widget>(
          //       context: context,
          //       barrierDismissible: true,
          //       builder: (BuildContext context) {
          //         return EventTypeDropdown();
          //       },
          //     ).then((dynamic value) => setState(() {}));
          //   },
          // ),
          

          // ##################################################################
          //        Nice to have if time allows but not needed for demo
          // ##################################################################

          // const Divider(
          //   height: 1.0,
          //   thickness: 1,
          // ),

          // ListTile(
          //   contentPadding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          //   leading: Icon(
          //     Icons.lens,
          //     color: _colorCollection[_selectedColorIndex]
          //   ),
          //   title: Text(
          //     _colorNames[_selectedColorIndex],
          //   ),
          //   onTap: () {
          //     showDialog<Widget>(
          //       context: context,
          //       barrierDismissible: true,
          //       builder: (BuildContext context) {
          //         return _ColorPicker();
          //       },
          //     ).then((dynamic value) => setState(() {}));
          //   },
          // ),
          
          // const Divider(
          //   height: 1.0,
          //   thickness: 1,
          // ),


          // ListTile(
          //   contentPadding: const EdgeInsets.all(5),
          //   leading: const Icon(
          //     Icons.subject,
          //     color: Colors.black87,
          //   ),
          //   title: TextField(
          //     controller: TextEditingController(text: _notes),
          //     onChanged: (String value) {
          //       _notes = value;
          //     },
          //     keyboardType: TextInputType.multiline,
          //     maxLines: null,
          //     style: const TextStyle(
          //       fontSize: 18,
          //       color: Colors.black87,
          //       fontWeight: FontWeight.w400
          //     ),
          //     decoration: const InputDecoration(
          //       border: InputBorder.none,
          //       hintText: 'Add description',
          //     ),
          //   ),
          // ),
          // ##################################################################

          const Divider(
            height: 1.0,
            thickness: 1,
          ),
        ],
      ));
}
}