/*
  This Dart code defines a Flutter HomePage widget, which includes a CalWidget to display a calendar view. 
  The calendar view is powered by the Syncfusion Flutter Calendar package. 
  The CalWidget is a ConsumerWidget, meaning it can access provider data using ref.watch. 
  The appointments data is fetched asynchronously from a Supabase database using the CalendarData class. 
  The appointments are then displayed in the calendar using the AppointmentDataSource class.
 */

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:nn/main.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:nn/data/python_api.dart';
import 'package:nn/controller/meeting.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';
import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/presentation/smart_add_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  // final FloatingSearchBarController controller = FloatingSearchBarController();
  final GlobalKey<AnimatedFloatingActionButtonState> key = GlobalKey();

  Widget smartAddButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SmartAddPage()),
        );
      },
      heroTag: "smartAdd",
      tooltip: 'Smart Add',
      child: Icon(Icons.smart_button),
    );
  }

  Widget formAddButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewTaskView()),
        );
      },
      heroTag: "formAdd",
      tooltip: 'Form Add',
      child: Icon(Icons.format_list_bulleted),
    );
  }

  // Widget loadICSButton() {
  // return FloatingActionButton(
  //   onPressed: () async {
  //     await loadICSRequest();
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  //   },
  //   heroTag: "loadICS",
  //   tooltip: 'Load ICS File',
  //   child: Icon(Icons.file_upload),
  // );
// }

  final Stream<List<Meeting>> meetingStream = streamMeetings();


  const String appTitle = 'NeuroNudge';
    return Scaffold(
      appBar: appBarBuilder(context, appTitle),
      drawer: const DrawerMenu(),
      body: CalWidget(meetingStream: meetingStream,),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[formAddButton(), smartAddButton(),],
        key: key,
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  }
}

class CalWidget extends ConsumerWidget {

  final Stream<List<Meeting>> meetingStream;

  const CalWidget({
    super.key, required this.meetingStream
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CalendarController calController = CalendarController();
    final view = ref.watch(viewProvider.select((value) => value));
    calController.view = view;

    return StreamBuilder<List<Meeting>>(
      stream: meetingStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // Use a custom data source with the list of meetings
          MeetingDataSource dataSource = MeetingDataSource(snapshot.data!);

        return SfCalendar(
          view: view,
          controller: calController,
          timeZone : 'Mountain Standard Time',
          dataSource: dataSource,
          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
          ),

          monthViewSettings: const MonthViewSettings( 
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),

          timeSlotViewSettings: TimeSlotViewSettings( 
            numberOfDaysInView: 1,
            timeIntervalHeight: 100,
            timeTextStyle: Theme.of(context).textTheme.bodyMedium
          ),

          scheduleViewSettings: const ScheduleViewSettings(
            appointmentItemHeight: 100,
            appointmentTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),

          onTap: (CalendarTapDetails details) {
          if (details.appointments != null &&
              details.targetElement == CalendarElement.appointment) {
            final Appointment appointment = details.appointments!.first;
            if (appointment is Meeting) {
            final Meeting meeting = appointment;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTaskView(meeting: meeting)),
            );}
          }
        },
        );
        } else {
          return Text('No data available');
        }
      },
      // loading: () => const Center(child: CircularProgressIndicator()),
      // error: (e, st) => Center(child: Text(e.toString())),
    );
  }
}

// Convert color string to hex value
Color parseColor(String colorString){
  String hex = colorString.replaceAll("#", "");
  int value = int.parse(hex, radix: 16);
  return Color(value).withAlpha(255);
}

Stream<List<Meeting>> streamMeetings() {

  final chunkStream = supabase.from('chunks').stream(primaryKey: ['id']);

   Stream<List<Map<String, dynamic>>> transformedChunkStream =
      chunkStream.map((list) {
    return list.map((chunk) {
      chunk['summary'] = chunk['display_name'];
      chunk['color'] = parseColor(chunk['color']);
      return chunk;
    }).toList();
  });

  final eventStream = supabase.from('events').stream(primaryKey: ['class_id']);

  Stream<List<Map<String, dynamic>>> transformedEventStream =
      eventStream.map((list) {
    return list.where((event) => event['summary'] != 'Sleep').map((event) {
      event['id'] = event['class_id'];
      event['color'] = parseColor(event['color']);
      return event;
    }).toList();
  });

  Stream<List<Meeting>> combinedStream = Rx.combineLatest2(
    transformedChunkStream,
    transformedEventStream,
    (List<Map<String, dynamic>> list1, List<Map<String, dynamic>> list2) {
      // Combine the lists from each stream and convert each Map to a Meeting
      return [...list1, ...list2]
          .map((eventJson) => Meeting.fromJson(eventJson))
          .toList();
    },
  );


  // List<Map<String, dynamic>> transformedEventData = eventStream.map<Map<String, dynamic>>((event) {
  //   return {
  //     'id': event['class_id'],  // Aliasing 'class_id' to 'id'
  //     'summary': event['summary'],
  //     'description': event['description'],
  //     'start_time': event['start_time'],
  //     'end_time': event['end_time'],
  //   };
  // }).toList();

  // List<Meeting> events =
  //     transformedEventData.map((eventJson) => Meeting.fromJson(eventJson)).toList();

  // final meetings = chunks + events;
  return combinedStream;
}
