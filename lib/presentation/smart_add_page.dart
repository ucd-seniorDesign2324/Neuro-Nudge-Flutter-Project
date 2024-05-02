import 'package:flutter/material.dart';
// import 'package:flutter_config/flutter_config.dart';
import 'package:nn/presentation/new_task_view.dart';
import 'package:nn/controller/meeting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SmartAddPage extends StatefulWidget {
  const SmartAddPage({Key? key}) : super(key: key);

  @override
  _SmartAddPageState createState() => _SmartAddPageState();
}

class _SmartAddPageState extends State<SmartAddPage> {
  final TextEditingController _controller = TextEditingController();

Future<void> _sendForParsing() async {
    final url = Uri.parse('http://10.0.2.2:5080/smart-add-process');
    final text = _controller.text + "Current Date: " + DateTime.now().toIso8601String();
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'inputString': text}));

      if (response.statusCode == 200) {
        // Directly decode the response body assuming it's a JSON string encapsulating a JSON object.
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse is String) {
          // If the decoded response is a string, decode it once more.
          final Map<String, dynamic> eventDetails = jsonDecode(decodedResponse);
          processEventDetails(eventDetails);
        } else if (decodedResponse is Map<String, dynamic>) {
          // If the decoded response is already a Map, use it directly.
          processEventDetails(decodedResponse);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  void processEventDetails(Map<String, dynamic> eventDetails) {
    try {
      Meeting newMeeting = Meeting.fromJson(eventDetails);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => NewTaskView(meeting: newMeeting)));
    } catch (e) {
      print('Error processing event details: $e');
    }
  }



  Map<String, dynamic> _parseJsonLikeString(String input) {
    // Adding double quotes around keys
    String corrected = input.replaceAllMapped(
        RegExp(r'(\w+)(:)', multiLine: true), (Match m) => '"${m[1]}":');

    // Adding double quotes around string values that are not already quoted
    corrected = corrected.replaceAllMapped(
        RegExp(r':\s*([a-zA-Z_]\w*)'), (Match m) => ': "${m[1]}"');

    // Try to decode to JSON
    try {
      return jsonDecode(corrected);
    } catch (e) {
      print('Error decoding JSON: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter event details',
              ),
            ),
            ElevatedButton(
              onPressed: _sendForParsing,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

