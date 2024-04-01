import 'package:flutter/material.dart';

enum RecurrenceType { none, daily, weekly, monthly, yearly }

class RecurrencePicker extends StatefulWidget {
  const RecurrencePicker({Key? key}) : super(key: key);

  @override
  _RecurrencePickerState createState() => _RecurrencePickerState();
}

class _RecurrencePickerState extends State<RecurrencePicker> {
  RecurrenceType _selectedRecurrence = RecurrenceType.none;
  int _interval = 1;
  final Set<int> _selectedDaysOfWeek = {};
  DateTime? _untilDate;

  Widget _buildDayOfWeekPicker() {
    const List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
    return ToggleButtons(
      isSelected:
          List.generate(7, (index) => _selectedDaysOfWeek.contains(index)),
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
        if (_selectedRecurrence != RecurrenceType.none)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText:
                    'Repeat every ${_selectedRecurrence.toString().split('.').last}(s)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _interval = int.tryParse(value) ?? 1;
                });
              },
            ),
          ),
        if (_selectedRecurrence == RecurrenceType.weekly)
          _buildDayOfWeekPicker(),
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
