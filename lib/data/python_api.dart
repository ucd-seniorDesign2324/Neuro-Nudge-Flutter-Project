import 'dart:convert';
import 'package:nn/controller/meeting.dart';
import 'package:http/http.dart' as http;

// Async function to retrieve JSON containing list of events from backend.
// Utilizes factory function in Meeting class to instantiate objects.
Future<List<Meeting>> fetchEvents() async {
  final response = await http.get(Uri.parse('localhost:3000'));

  if(response.statusCode == 200){
    // Probably don't need but don't want to delete just yet.
    // final List<Meeting> meetings; 
    // meetings = meetingsFromJson(jsonDecode(response.body) as List<Map<String, dynamic>>);

    var meetingObjsJson = jsonDecode(response.body)['event'] as List;
    List<Meeting> meetings = meetingObjsJson.map((eventJson) => Meeting.fromJson(eventJson)).toList(); 
    
    return meetings;
  }
  else {
    throw Exception('Failed to load meeting');
  }
}