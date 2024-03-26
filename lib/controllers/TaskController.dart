import 'package:flutter/material.dart';

class TaskController {
  String title = '';
  String eventType = '';
  String alarmTime = '';
  // List<String> subTasks = []; // for subtasks

  // Method to update the task title
  void updateTitle(String newTitle) {
    title = newTitle;
    // other validation here
  }

  // Method to update the event type from the dropdown
  void updateEventType(String newEventType) {
    eventType = newEventType;
    // Additional logic or state management here
  }

  // Method to update the alarm time from the dropdown
  void updateAlarmTime(String newAlarmTime) {
    alarmTime = newAlarmTime;
    // Additional logic or state management here
  }

  // Method to save the task
  Future<void> saveTask(BuildContext context) async {
    // Logic to save the task data goes here

    // Provide feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task Saved!')),
    );

    //navigate back or to another page upon successful save
    // Navigator.pop(context);
  }

}
