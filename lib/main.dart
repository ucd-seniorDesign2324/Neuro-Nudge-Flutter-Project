import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nn/presentation/home_page.dart';
import 'package:nn/presentation/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/firebase_options.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';


Future<Map<String, dynamic>> loadIcsFile() async {
  String fileContents = await rootBundle.loadString('assets/data.ics');
  final icsObj = ICalendar.fromString(fileContents);
  print(jsonEncode(icsObj.toJson()));
  return icsObj.toJson();

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
    DefaultFirebaseOptions.currentPlatform,
  );
  final cal = await loadIcsFile();

  runApp(MyApp(calendar: cal,));
} 

class MyApp extends StatelessWidget {

  const MyApp({super.key, required this.calendar});
  //TODO: send the data into the home page

  final Map<String, dynamic> calendar;

  @override
  Widget build(BuildContext context){
    const String appTitle = 'Neuro Nudge';
    return MaterialApp(
      title: appTitle,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}