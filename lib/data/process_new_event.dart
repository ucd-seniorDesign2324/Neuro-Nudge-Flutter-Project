import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nn/data/EventData.dart';

Future<void> processNewEvent(EventData eventData) async {
  // Convert EventData object to JSON string
  String jsonBody = json.encode(eventData.toJson());

  String apiUrl = 'http://10.0.2.2:5080/process-new-event';

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
    }
  } catch (e) {
    // Handle any errors that occur during the POST request
    print("Error sending event data: $e");
  }
}
