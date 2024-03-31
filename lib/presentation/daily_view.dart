import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/methods/data_source.dart';
import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/presentation/task_view.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';

// Stateful widget representing a monthly view
class DailyView extends StatefulWidget {

  const DailyView({super.key});

  @override
  State<DailyView> createState() => _DailyViewState();
}

String? _subjectText = '', _startTimeText = '',
        _endTimeText = '', _dateText = '', 
        _timeDetails = '';

// Potentially userful later on.
// ###################################################
// List<Color> _colorCollection = <Color>[];
// List<String> _colorNames = <String>[];
// int _selectedColorIndex = 0;
// int _selectedTimeZoneIndex = 0;
// List<String> _timeZoneCollection = <String>[];
// ###################################################

Appointment? _selectedAppointment;
late DataSource _events;
late DateTime _startDate;
late TimeOfDay _startTime;
late DateTime _endDate;
late TimeOfDay _endTime;
bool _isAllDay = false;
String _subject = '';
String _notes = '';

String appTitle = 'Neuro Nudge';

// State class for monthly view
class _DailyViewState extends State<DailyView> {

  late List<Appointment> appointments;
  CalendarController calendarController = CalendarController();
  
  @override
  void initState() {
    appointments = getDataSource();
    _events = DataSource(appointments);
    _selectedAppointment = null;
    // _selectedColorIndex = 0;
    // _selectedTimeZoneIndex = 0;
    _subject = '';
    _notes = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: appBarBuilder(context, appTitle),

      drawer: drawerMenuBuilder(context),

      body: SfCalendar(
        view: CalendarView.week,
        controller: calendarController,
        headerStyle: const CalendarHeaderStyle(
          textAlign: TextAlign.center,
        ),

        timeSlotViewSettings: const TimeSlotViewSettings( 
          numberOfDaysInView: 5
        ),

        showNavigationArrow: true,

        dataSource:  _events,
        onTap:       calendarTapped,
        onLongPress: onCalendarLongPressed,
      ),

      floatingActionButton: FloatingActionButton( 
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewTaskView())
            );
          },
          
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 45,)
        ),

    );
  }


  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Appointment appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.subject;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.startTime).toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.startTime).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.endTime).toString();
      _timeDetails = '$_startTimeText - $_endTimeText';
    } else if (details.targetElement == CalendarElement.calendarCell) {
      _subjectText = "You have tapped cell";
      _dateText = DateFormat('MMMM dd, yyyy').format(details.date!).toString();
      _timeDetails = '';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$_subjectText'),
          content: SizedBox(
            height: 80,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '$_dateText',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Text(_timeDetails!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          actionsAlignment: MainAxisAlignment.spaceBetween,
          
          actions: <Widget>[
            TextButton(
              onPressed: () {
                const Placeholder();
                },
                child: const Text('Delete')),
            TextButton(
              onPressed: () {
                const Placeholder();
                },
                child: const Text('Edit')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                },
                child: const Text('Close'))
          ],
        );
      }
    );
  }

  void onCalendarLongPressed(CalendarLongPressDetails details) {
    if (details.targetElement != CalendarElement.calendarCell &&
        details.targetElement != CalendarElement.appointment) {
          return;
    }

    setState(() {
      _selectedAppointment = null;
      _isAllDay = false;
      // _selectedColorIndex = 0;
      // _selectedTimeZoneIndex = 0;
      _subject = '';
      _notes = '';
      if (calendarController.view == CalendarView.week) {

        calendarController.view = CalendarView.day;
      } else {
        if (details.appointments != null && details.appointments!.length == 1){

          final Appointment meetingDetails = details.appointments![0];
          _startDate = meetingDetails.startTime;
          _endDate = meetingDetails.endTime;
          _isAllDay = meetingDetails.isAllDay;

          // _selectedColorIndex =
          //     _colorCollection.indexOf(meetingDetails.color);

          // _selectedTimeZoneIndex = meetingDetails.startTimeZone == ''
          //     ? 0
          //     : _timeZoneCollection.indexOf(meetingDetails.startTimeZone.toString());

          _subject = meetingDetails.subject == '(No title)'
              ? ''
              : meetingDetails.subject;

          _notes = meetingDetails.notes.toString();
          _selectedAppointment = meetingDetails;
        } else {
          final DateTime date = details.date!;
          _startDate = date;
          _endDate = date.add(const Duration(hours: 1));
        }

        _startTime = TimeOfDay(hour: _startDate.hour, minute: _startDate.minute);
        _endTime = TimeOfDay(hour: _endDate.hour, minute: _endDate.minute);

        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => TaskView(appointment: _selectedAppointment ?? 
              Appointment(
                subject: 'Conference', 
                startTime: DateTime.now(), 
                endTime: DateTime.now().add(const Duration(hours: 2)),
                color: const Color(0xFF0F8644))
                )
                ),
        );
      }
    });
  }
}