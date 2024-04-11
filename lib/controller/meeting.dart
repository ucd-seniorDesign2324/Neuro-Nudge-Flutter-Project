/*
  This Dart code defines a Meeting class representing a meeting event with properties such as title, 
  location, start time, end time, and description. 
  It also includes a factory constructor to create a Meeting object from JSON data. 
  Additionally, it provides getter and setter methods for each property.

  Furthermore, it defines a MeetingDataSource class, 
  which serves as the data source for calendar events using Meeting objects. 
  It extends CalendarDataSource from the Syncfusion Flutter Calendar package 
  and overrides methods to provide necessary information about the meetings.
 */

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Represents a meeting event.
class Meeting {

  String title;
  String location;
  DateTime startTime;
  DateTime endTime;
  String description;

  /// Constructor for [Meeting].
  Meeting({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.location = '',
    this.description = '',
  });

  /// Factory constructor to create a [Meeting] object from JSON data.
  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      description: json['description'] ?? '',
    );
  }

  // Getter and setter methods
  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  String getLocation() {
    return location;
  }

  void setLocation(String location) {
    this.location = location;
  }

  DateTime getStartTime() {
    return startTime;
  }

  void setStartTime(DateTime startTime) {
    this.startTime = startTime;
  }

  DateTime getEndTime() {
    return endTime;
  }

  void setEndTime(DateTime endTime) {
    this.endTime = endTime;
  }

  String getDescription() {
    return description;
  }

  void setDescription(String description) {
    this.description = description;
  }
}

/// Data source for calendar events using [Meeting] objects.
class MeetingDataSource extends CalendarDataSource {
  /// Constructor for [MeetingDataSource].
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    return Colors.blue; // Placeholder color, can be customized based on the meeting type
  }

  @override
  bool isAllDay(int index) {
    return false; // Assuming all meetings are not all-day events
  }
}
