import 'package:flutter/material.dart';
import 'package:nn/methods/drawer_menu.dart';
// import 'package:nn/settings_page.dart';
import 'package:nn/methods/evt_type_dropdown.dart';
import 'package:nn/methods/alarm_dropdown.dart';

// TODO:
// Define class for adding task
// Create methods for entering task data. I.e., task name, type, subtasks, etc
// Implement callback methods for user interactions. I.e., onTouch()
class TaskManagementView extends StatelessWidget {
  const TaskManagementView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //TODO: This will be the "X" and "save" buttons
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 5,
        actions: [
          // IconButton(
          //   //Do we need this, or is back button enough?
          //   onPressed: () {

          //   }, 
          //   icon: const Icon(Icons.close)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
            
              }, 
              icon: const Icon(Icons.save)),
          ),
        ],
        
      ),
      // drawer: drawerMenuBuilder(context),
      body: const TaskEditMenu(),
    );
  }
}


class TaskEditMenu extends StatefulWidget {
  const TaskEditMenu({super.key});

  @override
  State<TaskEditMenu> createState() => _TaskEditMenuState();
}

class _TaskEditMenuState extends State<TaskEditMenu> {

  @override
  Widget build(BuildContext context){
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: EventTypeDropdown(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AlarmDropdown(),
          ),
        ],
      )
    );
  }
}


/*
const Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),*/