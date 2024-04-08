

import 'package:flutter/material.dart';

const List<String> list = <String>['Exam','Assignment', 'Project', 'Study'];

class EventTypeDropdown extends StatefulWidget {
  const EventTypeDropdown({super.key});

  @override
  State<EventTypeDropdown> createState() => _EventTypeDropdownState();
}

class _EventTypeDropdownState extends State<EventTypeDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: list.map<DropdownMenuItem>((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(), 
      onChanged: (value) => {
        setState(() {
          dropdownValue = value;
        })
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