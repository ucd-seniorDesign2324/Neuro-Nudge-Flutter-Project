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

class Meeting {
  String title;
  DateTime startTime;
  DateTime endTime;
  String description;
  String recRule;
  bool isAllDay;

  // Constructor
  Meeting({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.description = "",
    this.recRule = "",
    this.isAllDay = false,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'description': String description,
        'startTime': String startTime,
        'endTime': String endTime,
        'rec_rule': String recRule,
        'isAllDay': bool isAllDay,
      } =>
        Meeting(
          title: title,
          description: description,
          startTime: DateTime.parse(startTime),
          endTime: DateTime.parse(endTime),
          recRule: recRule,
          isAllDay: isAllDay,
        ),
      _ => throw Exception('Failed to load meeting object')
    };
  }
  // Getter and setter methods
  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  // String getLocation() {
  //   return location;
  // }

  // void setLocation(String location) {
  //   this.location = location;
  // }

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

// Data Source
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
