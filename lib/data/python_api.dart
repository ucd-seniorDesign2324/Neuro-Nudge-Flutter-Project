import 'dart:convert';
import 'package:nn/controller/meeting.dart';
import 'package:nn/main.dart';
import 'package:http/http.dart' as http;

// Async function to retrieve JSON containing list of events from backend.
// Utilizes factory function in Meeting class to instantiate objects.
Future<List<Meeting>> fetchEvents(http.Client http) async {
  final data = await supabase.from('assignments').select('*');

  List<Meeting> meetings = data.map((eventJson) => Meeting.fromJson(eventJson)).toList(); 
  
  return meetings;
}

// Send API request to "load" a given ics file into the database
Future<void> loadICSRequest() async {
    try {
    // print("sending http request");
    final response = await http.get(Uri.parse('https://10.0.2.2:8000/load-ics'));
      if (response.statusCode == 200) {
        print(response);
    } else {
      throw Exception('Failed Get request. Status code ${response.statusCode}');
    }
  } catch (e) {
    throw Exception("Error Fetching Data: $e");
  }

}

Future<void> newMeeting(Meeting meeting) async {
  var url = Uri.parse('https://10.0.2.2:8000/new-meeting');
  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(meeting.toJson()),
    );

    if (response.statusCode == 200) {
      print('Meeting successfully sent to the backend to be added and processed.');
    } else {
      print('Failed to send meeting: ${response.body}');
    }
  } catch (e) {
    print('Error sending meeting: $e');
  }
}

Future<void> deleteMeeting(Meeting? meeting) async {
  var url = Uri.parse('https://10.0.2.2:8000/delete-meeting');
  try {
    var response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(meeting!.toJson()),
    );

    if (response.statusCode == 200) {
      print('Meeting successfully sent to the backend to be deleted.');
    } else {
      print('Failed to send meeting: ${response.body}');
    }
  } catch (e) {
    print('Error sending meeting: $e');
  }
}

Future<void> updateMeeting(Meeting meeting) async {
  var url = Uri.parse('https://10.0.2.2:8000/update-meeting');
  try {
    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(meeting.toJson()),
    );

    if (response.statusCode == 200) {
      print('Meeting successfully sent to the backend to be updated.');
    } else {
      print('Failed to send meeting: ${response.body}');
    }
  } catch (e) {
    print('Error sending meeting: $e');
  }
}
