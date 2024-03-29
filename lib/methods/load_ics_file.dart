
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
// import 'dart:convert';

Future<Map<String, dynamic>> loadIcsFile() async {
  String fileContents = await rootBundle.loadString('assets/data.ics');
  final icsObj = ICalendar.fromString(fileContents);
  // print(jsonEncode(icsObj.toJson()));
  return icsObj.toJson();
}
