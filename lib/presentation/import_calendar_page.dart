/*
  This Dart code defines a StatelessWidget called ImportCalendarPage, 
  which represents a page for importing a calendar. 
  It contains an AppBar with a custom title and icon, 
  and a body with two options for importing calendar data: "Import from Google" and "Upload .ics file". 
  Each option is represented by an icon and text in a row layout.
 */

import 'package:flutter/material.dart';

// Define a StatelessWidget for importing calendar page
class ImportCalendarPage extends StatelessWidget {
  const ImportCalendarPage({super.key});

  @override
  Widget build(BuildContext context){
    const String pageName = "Import Calender:";
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 5,
        title: const Text(
          pageName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black
          ),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.calendar_month_outlined),
                ),
                Text("Import from Google"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.upload_file),
                ),
                Text("Upload .ics file"),
              ],
            ),
          ),
        ],
      )
    );
  }
}



// class ImportCalendarPage extends StatelessWidget {
//   const ImportCalendarPage({super.key});

//   @override
//   Widget build(BuildContext context){
//     return const Scaffold(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text("Import Calendar:"),
//         ),
//         Row(

//         ),
//         Center(
//           child: Row(
//             children: [
//               // Icon(Icons.calendar_month_outlined),
//               Text("Import from Google"),
//             ],
//           ),
//         ),

//       ],

//     );
//   }
// }