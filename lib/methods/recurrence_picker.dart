/*
  This Dart code defines a StatefulWidget called RecurrencePicker 
  that provides a user interface for selecting recurrence options. 
  It includes a dropdown button for selecting the recurrence type, 
  a text form field for setting the interval, 
  an option for selecting days of the week (if the recurrence type is weekly), 
  and a date picker for selecting the end date of the recurrence.
 */

import 'package:flutter/material.dart';

// Define an enumeration for recurrence types
enum RecurrenceType { none, daily, weekly, monthly, yearly }

// RecurrencePicker StatefulWidget
class RecurrencePicker extends StatefulWidget {
  const RecurrencePicker({Key? key}) : super(key: key);

  @override
  _RecurrencePickerState createState() => _RecurrencePickerState();
}

// State class for RecurrencePicker
class _RecurrencePickerState extends State<RecurrencePicker> {
  // Initialize variables
  RecurrenceType _selectedRecurrence = RecurrenceType.none;
  int _interval = 1;
  final Set<int> _selectedDaysOfWeek = {};
  DateTime? _untilDate;

  // Widget to build day of week picker
  Widget _buildDayOfWeekPicker() {
    const List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
    return ToggleButtons(
      isSelected: List.generate(7, (index) => _selectedDaysOfWeek.contains(index)),
      onPressed: (int index) {
        setState(() {
          if (_selectedDaysOfWeek.contains(index)) {
            _selectedDaysOfWeek.remove(index);
          } else {
            _selectedDaysOfWeek.add(index);
          }
        });
      },
      children: List.generate(7, (index) => Text(days[index])),
    );
  }

  // Method to select end date
  Future<void> _selectUntilDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _untilDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _untilDate) {
      setState(() {
        _untilDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown button for selecting recurrence type
        DropdownButton<RecurrenceType>(
          value: _selectedRecurrence,
          onChanged: (RecurrenceType? newValue) {
            setState(() {
              _selectedRecurrence = newValue!;
            });
          },
          items: RecurrenceType.values.map((RecurrenceType classType) {
            return DropdownMenuItem<RecurrenceType>(
              value: classType,
              child: Text(classType.toString().split('.').last),
            );
          }).toList(),
        ),
        // Text form field for setting interval
        if (_selectedRecurrence != RecurrenceType.none)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Repeat every ${_selectedRecurrence.toString().split('.').last}(s)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _interval = int.tryParse(value) ?? 1;
                });
              },
            ),
          ),
        // Widget for weekly recurrence to select days of the week
        if (_selectedRecurrence == RecurrenceType.weekly)
          _buildDayOfWeekPicker(),
        // ListTile to select end date
        ListTile(
          title: Text(
              'Ends: ${_untilDate != null ? _untilDate!.toString().substring(0, 10) : 'Never'}'),
          trailing: Icon(Icons.calendar_today),
          onTap: () => _selectUntilDate(context),
        ),
      ],
    );
  }
}
