/*
 This Dart code defines a function processNewEvent that takes an EventData object, 
 converts it to a JSON string, and sends it to a specified API endpoint using a POST request. 
 It handles both successful and unsuccessful responses, printing appropriate messages to the console. 
 Any errors that occur during the process are caught and logged. 
 */

import 'dart:convert'; // Provides encoding and decoding functions for JSON and UTF-8
import 'package:http/http.dart' as http; // Provides functions for making HTTP requests
import 'package:nn/data/EventData.dart'; // Importing the EventData class

// Define a function to process new event data asynchronously
Future<void> processNewEvent(EventData eventData) async {
  // Convert EventData object to JSON string
  String jsonBody = json.encode(eventData.toJson());

  // String apiUrl = 'http://10.26.236.235:8000/process-new-event';
  String apiUrl = 'http://10.26.236.235:8000/process-new-event';

  try {
    // Send a POST request with the JSON-encoded data
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Handle successful request
      print(response.body);
      print("Event data successfully sent to the API");
    } else {
      // Handle unsuccessful request
      print("Failed to send event data. Status code: ${response.statusCode}");
      print(jsonBody);
    }
  } catch (e) {
    // Handle any errors that occur during the POST request
    print("Error sending event data: $e");
  }
}
