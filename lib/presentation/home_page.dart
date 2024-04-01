import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';
import 'package:nn/presentation/new_task_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';

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
  Widget build(BuildContext context) {
    const String appTitle = 'NeuroNudge';
    return Scaffold(
      appBar: appBarBuilder(context, appTitle),
      drawer: drawerMenuBuilder(context),
      body: const LoadWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewTaskView()),
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

class LoadWidget extends ConsumerWidget {
  const LoadWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calInfo = ref.watch(calProvider);

    return calInfo.when(data: (item) => 
    SfCalendar(
            view: CalendarView.schedule,
            dataSource: AppointmentDataSource(calInfo.value!),
            headerStyle: const CalendarHeaderStyle(
              textAlign: TextAlign.center,
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
  Future<List<Appointment>> loadIcsFile() async{
    String fileContents = await rootBundle.loadString('assets/data.ics');
    final icsObj = ICalendar.fromString(fileContents);
    

    // return icsObj.toJson();
    print("Accessing load process.");
    List<Appointment> appointments = <Appointment>[];
    Map<String, dynamic> calendarData = icsObj.toJson();
    List<dynamic> eventData = calendarData['data'];
    
    for (var event in eventData)
    // for (var i = 0; i < 5; i++) 
    {
      // var event = eventData[i];
      // print('checked');
      // Only create an Appointment if the event entry is a VEVENT
      // Check if the event has a 'type' key and if its value is 'VEVENT'
      if (event.containsKey('type') && event['type'] == "VEVENT") {
        // print('check passed');
        // String startStr = event['dtstart']['dt'];
        // String endStr = event['dtend']['dt'];
        // print(event);
        // print(startStr);
        // print(endStr);
        DateTime startTime = DateTime.parse(event['dtstart']['dt']);
        DateTime endTime;
        if (event.containsKey('dtend')) {
          endTime = DateTime.parse(event['dtend']['dt']);
        }
        else {
          endTime = startTime.add(const Duration(hours: 1));
        }
        // print(startTime);
        // print(endTime);
        // print(event['subject']);
        String subject = event['summary'];
        // String notes = event['description'];
        Color color = Colors.blue;

        appointments.add(Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: subject,
          // notes: notes,
          color: color,
          // Add other fields as we need them. Just did a few to start.
        ));
      }
    }
    return appointments;
  }
}

final calData = Provider((ref) => CalendarData(),);

final calProvider = FutureProvider((ref) async {
  final cal = ref.read(calData);

  return cal.loadIcsFile();
},);


// class FakeData implements CalendarData {
//   @override
//   Future<List<Appointment>> loadIcsFile() async {
//     String fileContents = await rootBundle.loadString('assets/data.ics');
//     final icsObj = ICalendar.fromString(fileContents);
    

//     // return icsObj.toJson();
//     print("Accessing load process.");
//     List<Appointment> appointments = <Appointment>[];
//     Map<String, dynamic> calendarData = icsObj.toJson();
//     List<dynamic> eventData = calendarData['data'];
    
//     for (var event in eventData)
//     // for (var i = 0; i < 5; i++) 
//     {
//       // var event = eventData[i];
//       // print('checked');
//       // Only create an Appointment if the event entry is a VEVENT
//       // Check if the event has a 'type' key and if its value is 'VEVENT'
//       if (event.containsKey('type') && event['type'] == "VEVENT") {
//         // print('check passed');
//         // String startStr = event['dtstart']['dt'];
//         // String endStr = event['dtend']['dt'];
//         // print(event);
//         // print(startStr);
//         // print(endStr);
//         DateTime startTime = DateTime.parse(event['dtstart']['dt']);
//         DateTime endTime;
//         if (event.containsKey('dtend')) {
//           endTime = DateTime.parse(event['dtend']['dt']);
//         }
//         else {
//           endTime = startTime.add(const Duration(hours: 1));
//         }
//         // print(startTime);
//         // print(endTime);
//         // print(event['subject']);
//         String subject = event['summary'];
//         // String notes = event['description'];
//         Color color = Colors.blue;

//         appointments.add(Appointment(
//           startTime: startTime,
//           endTime: endTime,
//           subject: subject,
//           // notes: notes,
//           color: color,
//           // Add other fields as we need them. Just did a few to start.
//         ));
//       }
//     }
//     return appointments;
//   }
  
// }