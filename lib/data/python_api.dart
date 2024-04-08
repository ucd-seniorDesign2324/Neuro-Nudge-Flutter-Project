import 'dart:convert';
import 'package:nn/controller/meeting.dart';
import 'package:nn/main.dart';
import 'package:http/http.dart' as http;

// Async function to retrieve JSON containing list of events from backend.
// Utilizes factory function in Meeting class to instantiate objects.
Future<List<Meeting>> fetchEvents(http.Client http) async {
  final data = await supabase.from('assignments').select('*');
  print(data);
  List<Meeting> meetings = data.map((eventJson) => Meeting.fromJson(eventJson)).toList(); 
  
  return meetings;
}