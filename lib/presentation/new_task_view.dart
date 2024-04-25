import 'package:flutter/material.dart';
import 'package:nn/methods/evt_type_dropdown.dart';
import 'package:nn/methods/alarm_dropdown.dart';
import 'package:nn/methods/recurrence_picker.dart';
import 'package:nn/data/EventData.dart';
import 'package:nn/data/process_new_event.dart';
import 'package:nn/controller/meeting.dart';
import 'package:nn/data/python_api.dart';
// import 'package:nn/methods/sub_task_dropdown.dart';

// TODO:
// Define class for adding task
// Create methods for entering task data. I.e., task name, type, subtasks, etc
// Implement callback methods for user interactions. I.e., onTouch()
class NewTaskView extends StatelessWidget {

  final Meeting? meeting;

  NewTaskView({super.key, this.meeting});

  final GlobalKey<_TaskEditMenuState> _taskEditMenuKey = GlobalKey<_TaskEditMenuState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: This will be the "X" and "save" buttons
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 5,
        actions: [
          if (meeting != null) // Show the delete button only if editing an existing meeting
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteMeeting(context),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _taskEditMenuKey.currentState?.onSavePressed(), 
              icon: const Icon(Icons.save)),
          ),
        ],
      ),
      body: TaskEditMenu(key: _taskEditMenuKey, meeting: meeting),
    );
  }

    void _deleteMeeting(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await deleteMeeting(meeting);
                // Delete API Event Call here
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class TaskEditMenu extends StatefulWidget {

  final Meeting? meeting;

  const TaskEditMenu({Key? key, this.meeting}) : super(key: key);

  @override
  State<TaskEditMenu> createState() => _TaskEditMenuState();
}

class _TaskEditMenuState extends State<TaskEditMenu> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String? _eventType;
  String? _recurrence;

  Future<void> _pickDate(BuildContext context, {bool isStart = true}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isStart ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _pickTime(BuildContext context, {bool isStart = true}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          isStart ? _startTime ?? TimeOfDay.now() : _endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

    @override
  void initState() {
    super.initState();
    _startDate = widget.meeting?.startTime;
    _endDate = widget.meeting?.endTime;
    _startTime = widget.meeting != null ? TimeOfDay(hour: widget.meeting!.startTime.hour, minute: widget.meeting!.startTime.minute) : null;
    _endTime = widget.meeting != null ? TimeOfDay(hour: widget.meeting!.endTime.hour, minute: widget.meeting!.endTime.minute) : null;
    _titleController = TextEditingController(text: widget.meeting?.subject ?? '');
    _descriptionController = TextEditingController(text: widget.meeting?.notes ?? '');
    _eventType = widget.meeting?.eventType;
  }

  void onSavePressed() {
    // 1. Extract data from form fields
    String title = _titleController.text;
    String description = _descriptionController.text;

    // 2. Combine date and time for start and end
    DateTime startDT;
    DateTime endDT;
    // if (_startDate != null && _startTime != null) {
      startDT = DateTime(
        _startDate!.year,
        _startDate!.month,
        _startDate!.day,
        _startTime!.hour,
        _startTime!.minute,
      );
    // }
    // if (_endDate != null && _endTime != null) {
      endDT = DateTime(
        _endDate!.year,
        _endDate!.month,
        _endDate!.day,
        _endTime!.hour,
        _endTime!.minute,
      );
    // }

    // 3. Create a Meeting object
    Meeting meeting = Meeting(
      subject : title,
      notes : description,
      startTime: startDT,
      endTime: endDT,
      eventType: _eventType ?? ''
    );

    // 3. Create an EventData object
    // EventData eventData = EventData(
    //   title: title,
    //   description: description,
    //   startDateTime: startDT,
    //   endDateTime: endDT,
    //   eventType: 'Exam'
    // );

    // 4. Process the new event
    newMeeting(meeting);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                  'Start: ${_startDate != null ? _startDate!.toString().substring(0, 10) : 'Not set'}, ${_startTime != null ? _startTime!.format(context) : 'Not set'}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                _pickDate(context);
                _pickTime(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                  'End: ${_endDate != null ? _endDate!.toString().substring(0, 10) : 'Not set'}, ${_endTime != null ? _endTime!.format(context) : 'Not set'}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                _pickDate(context, isStart: false);
                _pickTime(context, isStart: false);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: EventTypeDropdown(
              initialValue: _eventType,
              onChanged: (value) {
                setState(() {
                  _eventType = value;
                });
              }
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: AlarmDropdown(),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: RecurrencePicker(),
          // ),
        ],
      ),
    ));
  }
}
