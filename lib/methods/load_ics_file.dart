
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:convert';
// import 'dart:io';

Future<Map<String, dynamic>> loadIcsFile() async {
  // print("Load function called");
  String fileContents = await rootBundle.loadString('assets/data.ics');
  final icsObj = ICalendar.fromString(fileContents);
  //print(jsonEncode(icsObj.toJson()));
  // final directory = await getApplicationDocumentsDirectory();
  // final path = '${directory.path}/data.json';
  // File file = File(path);
  // print("attempting to print to file");
  // await file.writeAsString(icsObj.toString());
  // print("file written");
  return icsObj.toJson();
}
