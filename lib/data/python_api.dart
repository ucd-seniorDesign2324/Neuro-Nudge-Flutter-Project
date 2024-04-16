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

// Get request for "importing" ICS file
Future<http.Response> importEvents() async {
    
    try{
      final response = await http.get(Uri.parse('https://127.0.0.1:8000/load-ics'));
      if(response.statusCode == 200){
        return response;
      }
      else{
        throw Exception('Failed Get request. Status code ${response.statusCode}');
      }
    } catch(e){
      throw Exception("Error Fetching Data: $e");
    }
}