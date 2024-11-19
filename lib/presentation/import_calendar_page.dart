/*
  This Dart code defines a StatelessWidget called ImportCalendarPage, 
  which represents a page for importing a calendar. 
  It contains an AppBar with a custom title and icon, 
  and a body with two options for importing calendar data: "Import from Google" and "Upload .ics file". 
  Each option is represented by an icon and text in a row layout.
 */


import 'package:flutter/material.dart';
import 'package:nn/data/python_api.dart';
import 'package:nn/presentation/home_page.dart';

// Define a StatelessWidget for importing calendar page
class ImportCalendarPage extends StatelessWidget {
  const ImportCalendarPage({super.key});

  @override
  Widget build(BuildContext context){
    const String pageName = "Import Calendar:";
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 275,
                  child: OutlinedButton.icon(
                    label: const Text("Upload from Google"),
                    icon: const Icon(Icons.calendar_month_outlined),
                    style:  Theme.of(context).outlinedButtonTheme.style,
                    onPressed: (){
                      const Placeholder();
                    },),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 275,
                  child: OutlinedButton.icon(
                    label: const Text("Upload .ics file"),
                    icon: const Icon(Icons.calendar_month_outlined),
                    style:  Theme.of(context).outlinedButtonTheme.style,
                    onPressed: () async {
                      await loadICSRequest();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}