import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';

// Stateful widget representing a monthly view
class MonthlyView extends StatefulWidget {

  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

// State class for monthly view
class _MonthlyViewState extends State<MonthlyView> {
  static String appTitle = 'Neuro Nudge';
  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: appBarBuilder(context, appTitle),

      drawer: drawerMenuBuilder(context),

      body: SfCalendar(
        view: CalendarView.month,

        headerStyle: const CalendarHeaderStyle(
          textAlign: TextAlign.center,
          ),

        showNavigationArrow: true,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: const MonthViewSettings( 
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
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

List<Meeting> _getDataSource(){
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Meeting> source){
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