import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/methods/data_source.dart';
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

        monthViewSettings: const MonthViewSettings( 
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),

        showNavigationArrow: true,
        dataSource: DataSource(getDataSource()),
        
        // onTap: ,
        // onLongPress: ,

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
  
  // DateTime today = DateTime.now();
  // DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  // DateTime endTime = startTime.add(const Duration(hours: 2));

  // meetings.add(Appointment(subject: 'Conference', startTime:startTime, endTime:endTime,color: const Color(0xFF0F8644)));

  // today = DateTime.now();
  // startTime = DateTime(today.year, today.month, today.day, 13, 0, 0);
  // endTime = startTime.add(const Duration(hours: 2));
  // meetings.add(Appointment(subject: 'Table', startTime:startTime, endTime:endTime,color: const Color.fromARGB(255, 134, 43, 15)));

    List<String> eventNameCollection = <String>[];
    eventNameCollection.add('General Meeting');
    eventNameCollection.add('Plan Execution');
    eventNameCollection.add('Project Plan');
    eventNameCollection.add('Consulting');
    eventNameCollection.add('Support');
    eventNameCollection.add('Development Meeting');
    eventNameCollection.add('Scrum');
    eventNameCollection.add('Project Completion');
    eventNameCollection.add('Release updates');
    eventNameCollection.add('Performance Check');

    List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF85461E));
    colorCollection.add(const Color(0xFFFF00FF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));

  final DateTime today = DateTime.now();
    final Random random = Random();
    for (int month = -1; month < 2; month++) {
      for (int day = -5; day < 5; day++) {
        for (int hour = 9; hour < 18; hour += 5) {
          meetings.add(Appointment(
            startTime: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour)),
            endTime: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour + 2)),
            color: colorCollection[random.nextInt(9)],
            startTimeZone: '',
            endTimeZone: '',
            notes: '',
            isAllDay: false,
            subject: eventNameCollection[random.nextInt(7)],
          ));
        }
      }
    }

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
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