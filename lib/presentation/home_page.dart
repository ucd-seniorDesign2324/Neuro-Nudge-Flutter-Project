import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:nn/methods/drawer_menu.dart';
import 'package:nn/methods/app_bar.dart';
import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/methods/load_ics_file.dart';

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

  Future<List<Appointment>> _getDataSource() async {
    // Your logic to load and parse the calendar data
    // For example, this could be loading from a file or fetching from a network
    return [];
  }

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'NeuroNudge';
    return Scaffold(
      appBar: appBarBuilder(context, appTitle),
      drawer: drawerMenuBuilder(context),
      body: FutureBuilder<List<Appointment>>(
        future: _getDataSource(), // Call the async function to get the data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // show an error if it didn't load
            return Center(child: Text('Error loading data'));
          } else {
            // Once the data is loaded, create the SfCalendar with it
            return SfCalendar(
              view: CalendarView.schedule,
              dataSource: AppointmentDataSource(snapshot.data!),
              headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center,
              ),
              scheduleViewSettings: const ScheduleViewSettings(
                appointmentItemHeight: 100,
                appointmentTextStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
        },
      ),
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


// ######################################################################################
//
//  The following code creates an event for the calendar view. Used for testing
//
// ######################################################################################

Future<List<Appointment>> _getDataSource() async {
  Map<String, dynamic> calendarData = await loadIcsFile();
  List<dynamic> eventData = calendarData['data'];
  List<Appointment> appointments = [];

  for (var event in eventData) {
    DateTime startTime = DateTime.parse(event['dtstart']['dt']);
    print(startTime);
    DateTime endTime = DateTime.parse(event['dtend']['dt']);
    print(endTime);
    String subject = event['summary'];
    // Assuming you have a default color or logic to determine the color
    Color color = Colors.blue; // Example: default color

    appointments.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      color: color,
      // Add other fields if necessary
    ));
  }

  return appointments;
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
