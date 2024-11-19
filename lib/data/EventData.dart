import 'package:flutter/material.dart';

class EventData {
  final String title;
  final String description;
  final DateTime startDateTime; // Combining date and time into one
  final DateTime endDateTime; // Combining date and time into one
  final String eventType; // Assuming EventTypeDropdown returns a string

  EventData({
    required this.title,
    required this.description,
    required this.startDateTime,
    required this.endDateTime,
    required this.eventType,
  });

    // Method to convert EventData to a Map
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'startDateTime': startDateTime.toIso8601String(),
        'endDateTime': endDateTime.toIso8601String(),
        'eventType': eventType,
      };
}
