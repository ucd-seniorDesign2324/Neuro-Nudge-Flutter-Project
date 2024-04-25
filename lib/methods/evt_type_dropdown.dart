/*
  This Dart code defines a Flutter widget called EventTypeDropdown, 
  which displays a dropdown menu of event types. 
  The dropdown is populated with items from the list constant. 
  When an item is selected, the dropdown value is updated accordingly. 
  The widget is implemented as a stateful widget to manage the dropdown's state.
*/ 

import 'package:flutter/material.dart';

const List<String> list = <String>['Exam','HW', 'Quiz', 'Midterm', 'Lab', 'Final',  'Project', 'Study'];

class EventTypeDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  const EventTypeDropdown({super.key, this.initialValue, this.onChanged});

  @override
  State<EventTypeDropdown> createState() => _EventTypeDropdownState();
}

class _EventTypeDropdownState extends State<EventTypeDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue ?? list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: list.map<DropdownMenuItem>((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(), 
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
        });
        widget.onChanged?.call(value!);
      },
      hint: const Text('Type'),
      icon: const Icon(Icons.list),
      );
  }
}

// class _EventTypeDropdownState extends State<EventTypeDropdown> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry(value: value, label: value);
//       }).toList(),
//       hintText: "Type",
//       onSelected: (String? value) {
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       );
//   }
// }