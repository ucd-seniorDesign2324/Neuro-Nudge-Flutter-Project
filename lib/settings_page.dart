import 'package:flutter/material.dart';

import 'package:nn/methods/drawer_menu.dart';

// TODO:
// Create Settings page class
// Build widget to roughly match wireframe

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 

  @override
  Widget build(BuildContext context){
    const String pageName = "Settings";
    return Scaffold( 
      appBar: AppBar( 
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 5,
        centerTitle: true,
        title: const Text(
          pageName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black
            ),
          
          ),
        ),
        drawer: drawerMenuBuilder(context),
        // body: ,
      );
  }
}