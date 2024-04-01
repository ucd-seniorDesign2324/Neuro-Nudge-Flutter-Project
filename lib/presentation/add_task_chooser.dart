import 'package:flutter/material.dart';
import 'smart_add_page.dart';
import 'package:nn/presentation/new_task_view.dart';

class ChooserPage extends StatelessWidget {
  const ChooserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmartAddPage()),
              ),
              child: Text('Smart Add'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTaskView()),
              ),
              child: Text('Manual Add'),
            ),
          ],
        ),
      ),
    );
  }
}
