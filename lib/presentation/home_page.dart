/*
  This Dart code defines a Flutter HomePage widget, which includes a CalWidget to display a calendar view. 
  The calendar view is powered by the Syncfusion Flutter Calendar package. 
  The CalWidget is a ConsumerWidget, meaning it can access provider data using ref.watch. 
  The appointments data is fetched asynchronously from a Supabase database using the CalendarData class. 
  The appointments are then displayed in the calendar using the AppointmentDataSource class.
 */


import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:nn/main.dart';
import 'package:http/http.dart' as http;

import 'package:nn/data/python_api.dart';
import 'package:nn/controller/meeting.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';
import 'package:nn/presentation/new_task_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'NeuroNudge';
    return Scaffold(
      appBar: appBarBuilder(context, appTitle),
      drawer: const DrawerMenu(),
      body: const CalWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTaskView()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }
}

class CalWidget extends ConsumerStatefulWidget {
  const CalWidget({
    super.key,
  });
  @override
  ConsumerState<CalWidget> createState() => _CalWidgetState();

}

class _CalWidgetState extends ConsumerState<CalWidget>{
  
  late List<Meeting> appointments = [];
  CalendarController calController = CalendarController();

  @override
  void initState() {
    super.initState();
  }

  // TODO: Perhaps use FutureBuilder widget for calendar data?
  @override
  Widget build(BuildContext context) {

    final calInfo = ref.watch(calProvider);

    // View changing
    final view = ref.watch(viewProvider.select((value) => value));
    calController.view = view;

    return calInfo.when(
      data: (item) =>
        SfCalendar(
          view: view,
          controller: calController,
          timeZone : 'Mountain Standard Time',
          dataSource: MeetingDataSource(calInfo.value!),
          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
          ),

          monthViewSettings: const MonthViewSettings( 
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),

          timeSlotViewSettings: const TimeSlotViewSettings( 
            numberOfDaysInView: 1
          ),

          scheduleViewSettings: const ScheduleViewSettings(
            appointmentItemHeight: 100,
            appointmentTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(e.toString())),
            );
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class CalendarData {
  Future<List<Meeting>> loadAppointmentsFromSupabase() async {
    final chunkData = await supabase
        .from('chunks')
        .select('summary, start_time, end_time, isallday, vrecur');

    List<Meeting> chunks = chunkData.map((eventJson) => Meeting.fromJson(eventJson)).toList();

    final eventData = await supabase
        .from('chunks')
        .select('summary, start_time, end_time, isallday, vrecur');

    List<Meeting> events = eventData.map((eventJson) => Meeting.fromJson(eventJson)).toList();

    final meetings = chunks + events;
    // final List<Meeting> appointments = [];

    // for (final appointmentData in response) {
    //   String startDtStr = appointmentData['starttime'];
    //   String endDtStr = appointmentData['endtime'];
    //   DateTime startTime = DateTime.parse(startDtStr);
    //   DateTime endTime = DateTime.parse(endDtStr);
    //   String subject = appointmentData['title'] ?? '';
    //   bool isAllDay = appointmentData['isallday'] ?? false;
    //   String recurrenceRule = appointmentData['vrecur'] ?? '';
    //   Color color = Colors.blue; // Assuming all appointments have the same color for simplicity

    //   appointments.add(Meeting(
    //     startTime: startTime,
    //     endTime: endTime,
    //     description: ,
    //     isAllDay: isAllDay,
    //   ));
    // }
    return meetings;
  }

  // Helper function to format the time zone offset as a string
  // String _formatTimeZoneOffset(Duration offset) {
  //   String sign = offset.isNegative ? "-" : "+";
  //   int hours = offset.inHours.abs();
  //   int minutes = (offset.inMinutes.abs() % 60);
  //   return "$sign${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  // }

  // DateTime _supabaseToFlutterDateTime(String dateTimeStr) {
  // // Replace the space with 'T' and remove the dot in the timezone offset
  // String isoDateTimeStr = dateTimeStr.replaceAll(' ', 'Z').replaceAll('.00', ':00');

  // // Now the string should be in a format that DateTime.parse can handle
  // DateTime dateTime = DateTime.parse(isoDateTimeStr);

  // return dateTime;

  // }
}

final calData = Provider(
  (ref) => CalendarData(),
);

final calProvider = FutureProvider(
  (ref) {
    final cal = ref.read(calData);

    return cal.loadAppointmentsFromSupabase();
  },
);
