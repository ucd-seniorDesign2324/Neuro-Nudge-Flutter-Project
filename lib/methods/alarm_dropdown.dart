

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
