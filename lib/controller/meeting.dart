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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nn/main.dart';

class Meeting extends Appointment {
  int dbID;
  String eventType;

  // Constructor
  Meeting({
    required subject,
    required startTime,
    required endTime,
    recurrenceRule = "null",
    notes = "",
    isAllDay = false,
    this.eventType = '',
    this.dbID = 0,
    color
  }) : super(
          subject: subject,
          startTime: startTime,
          endTime: endTime,
          notes: notes,
          recurrenceRule: recurrenceRule,
          isAllDay: isAllDay,
          color: color
      );

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      subject: json['display_name'] as String,
      notes: json['description'] as String? ?? "",
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      recurrenceRule: json['recurrence'] as String? ?? "",
      isAllDay: json['isallday'] as bool? ?? false,
      dbID: json['id'] as int,
      eventType: json['eventType'] as String? ?? "",
      color: json['color'] as Color? ?? Colors.green
    );
  }

  Map<String, dynamic> toJson() => {
        'summary': subject,
        'description': notes,
        'start_time': startTime.toIso8601String(),
        'end_time': endTime.toIso8601String(),
        'isAllDay' : isAllDay,
        'recurrence' : recurrenceRule == "" ? "null" : recurrenceRule, 
        'id' : dbID,
        'eventType': eventType,
      };

}

// Data Source
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return getAppointments(index).startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return getAppointments(index).endTime;
  }

  @override
  String getSubject(int index) {
    return getAppointments(index).subject;
  }

  @override
  Color getColor(int index) {
    return getAppointments(index).color;
  }

  @override
  bool isAllDay(int index) {
    return getAppointments(index).isAllDay;
  }

  @override
  String? getRecRule(int index){
    return getAppointments(index).recurrenceRule;
  }

  int getDbID(int index) {
    return getAppointments(index).dbID;
  }

  Meeting getAppointments(int index) {
    return appointments![index] as Meeting;
  }
}
