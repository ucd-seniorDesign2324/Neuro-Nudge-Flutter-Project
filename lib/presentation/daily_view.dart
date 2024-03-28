import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';

// Stateful widget representing a monthly view
class DailyView extends StatefulWidget {

  const DailyView({super.key});

  @override
  State<DailyView> createState() => _DailyViewState();
}

// State class for monthly view
class _DailyViewState extends State<DailyView> {
  static String appTitle = 'Neuro Nudge';
  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: appBarBuilder(context, appTitle),

      drawer: drawerMenuBuilder(context),

      body: SfCalendar(
        view: CalendarView.timelineDay,

        headerStyle: const CalendarHeaderStyle(
          textAlign: TextAlign.center,
          ),

        showNavigationArrow: true,
        dataSource: AppointmentDataSource(_getDataSource()),
        timeSlotViewSettings: const TimeSlotViewSettings( 
          startHour: 8,
          endHour: 21,
          numberOfDaysInView: 1
        ),

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

class Meeting{
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}