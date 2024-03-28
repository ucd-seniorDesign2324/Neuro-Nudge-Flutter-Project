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

  @override
  Widget build(BuildContext context){
    const String appTitle = 'NeuroNudge';
    return Scaffold(

        appBar: appBarBuilder(context, appTitle),

        drawer: drawerMenuBuilder(context),
        
        // 
        body: SfCalendar(
          view: CalendarView.schedule,
          dataSource: AppointmentDataSource(_getDataSource()),
          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
            ),
          //TODO: on tap: show event, onLongPressed: edit event


          scheduleViewSettings: const ScheduleViewSettings( 
            appointmentItemHeight: 100,
            appointmentTextStyle: TextStyle( 
              fontSize: 20,
            )
          ),
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

