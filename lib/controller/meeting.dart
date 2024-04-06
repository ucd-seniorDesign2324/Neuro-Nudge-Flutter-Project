import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Meeting {
  String title;
  String location;
  DateTime startTime;
  DateTime endTime;
  String description;

  // Constructor
  Meeting({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.location = "",
    this.description = "",
  });

  factory Meeting.fromJson(Map<String, dynamic> json){
    return switch (json){
      {
      'title': String title,
      'location': String location,
      'startTime': String startTime,
      'endTime': String endTime,
      'description': String description
      
      } => Meeting(
        title: title,
        location: location,
        startTime: DateTime.parse(startTime),
        endTime: DateTime.parse(endTime),
        description: description,
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

// Data Source
class MeetingDataSource extends CalendarDataSource{
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