import 'dart:convert';
import 'package:nn/controller/meeting.dart';
import 'package:http/http.dart' as http;

// Async function to retrieve JSON containing list of events from backend.
// Utilizes factory function in Meeting class to instantiate objects.
Future<List<Meeting>> fetchEvents(http.Client http) async {
  final response = await http.get(Uri.parse('https://fgocfoakntmlhgtftrzh.supabase.co'));

  if(response.statusCode == 200){

    // Take list of JSON objects and create list of Meeting objects.
    var meetingObjsJson = jsonDecode(response.body)['event'] as List;
    List<Meeting> meetings = meetingObjsJson.map((eventJson) => Meeting.fromJson(eventJson)).toList(); 
    
    return meetings;
  }
  else {
    throw Exception('Failed to load meeting');
  }
}