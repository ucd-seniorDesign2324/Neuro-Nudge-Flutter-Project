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
    // String url = FlutterConfig.get('OPENAI-SmartAdd-Thread');
    // String key = FlutterConfig.get('OPENAI-API-Key');
    // API call to text parser GPT
    final response = await http.post(Uri.parse(''), body: {
      'eventText': _controller.text,
    });

    if (response.statusCode == 200) {
      // Assuming the response is a JSON
      final Map<String, dynamic> eventDetails = json.decode(response.body);

      Meeting newMeeting = Meeting.fromJson(eventDetails);
      // Redirect to Manual Add Page with the event details
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          //builder: (context) => NewTaskView(eventDetails: eventDetails)
          builder: (context) => NewTaskView(meeting: newMeeting),
        ),
      );
    } else {
      // Handle the error or show an error message
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

