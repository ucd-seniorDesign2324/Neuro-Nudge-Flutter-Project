/*
  This Dart code defines a dropdown widget AlarmDropdown for selecting alarm duration options 
  before an event. 
  It contains a list of alarm options in minutes (list). 
  The dropdown menu is populated with these options, 
  and the user can select one option. When an option is selected, 
  the state of the widget is updated to reflect the new selection. 
  The selected value is stored in the dropdownValue variable and is updated using the setState() method. 
  The dropdown displays a hint text and an icon for better user interaction.
 */

import 'package:flutter/material.dart';

const List<String> list = <String>['5', '10', '15', '20'];

class AlarmDropdown extends StatefulWidget {
  const AlarmDropdown({super.key});

  @override
  State<AlarmDropdown> createState() => _AlarmDropdownState();
}

class _AlarmDropdownState extends State<AlarmDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: list.map<DropdownMenuItem>((String value) {
        return DropdownMenuItem(value: value, child: Text('$value minutes before'));
      }).toList(), 
      onChanged: (value) => {
        setState(() {
          dropdownValue = value;
        })
      },
      hint: const Text('5 minutes before'),
      icon: const Icon(Icons.alarm),
      );
  }
}
