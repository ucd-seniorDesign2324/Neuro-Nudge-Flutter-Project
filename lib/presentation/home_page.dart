import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';
import 'package:nn/presentation/new_task_view.dart';

// TODO: 
// Fetch event data and display on list tiles.
// Define page navigations 


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FloatingSearchBarController controller = FloatingSearchBarController();

  String? _subjectText = '', _startTimeText = '',
          _endTimeText = '', _dateText = '', 
          _timeDetails = '';


  @override
  Widget build(BuildContext context){
    const String appTitle = 'NeuroNudge';
    return Scaffold(

        appBar: appBarBuilder(context, appTitle),

        drawer: drawerMenuBuilder(context),
        
        // 
        body: SfCalendar(
          view: CalendarView.schedule,

          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
          ),

          scheduleViewSettings: const ScheduleViewSettings( 
            appointmentItemHeight: 100,
            appointmentTextStyle: TextStyle( 
              fontSize: 20,
            )
          ),

          dataSource: AppointmentDataSource(_getDataSource()),
          
          onTap: calendarTapped,
          // onLongPress: ,
          //TODO: onLongPressed: edit event
          
        ),
      

        floatingActionButton: FloatingActionButton( 
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewTaskView()),
            );
          },
          
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 45,
          )
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
}


// ######################################################################################
// 
//  The following code creates an event for the calendar view. Used for testing
//
// ######################################################################################

List<Appointment> _getDataSource(){
  final List<Appointment> meetings = <Appointment>[];
  DateTime today = DateTime.now();
  DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(subject: 'Conference', startTime:startTime, endTime:endTime,color: const Color(0xFF0F8644)));

  today = DateTime.now();
  startTime = DateTime(today.year, today.month, today.day, 13, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(subject: 'Table', startTime:startTime, endTime:endTime,color: const Color.fromARGB(255, 134, 43, 15)));


  return meetings;
}

class AppointmentDataSource extends CalendarDataSource{
  AppointmentDataSource(List<Appointment> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index){
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index){
    return appointments![index].to;
  }

  @override
  String getSubject(int index){
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index){
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index){
    return appointments![index].isAllDay;
  }
}

