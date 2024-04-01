import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nn/methods/drawer_menu.dart';

// Stateless widget represnting the settings page
class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

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
        body: const DropDownMenu()
      );
  }
}


// List of hours in 12-hour format
const List<String> hours = <String>[
  '12:00', '1:00', '2:00', '3:00', '4:00', '5:00', 
  '6:00', '7:00', '8:00', '9:00', '10:00', '11:00'
  ];

// List of meridiem values (AM and PM)
const List<String> meridiem = <String>['AM', 'PM'];

// Stateful widget representing a dropdown menu for selecting time restrictions
class DropDownMenu extends StatefulWidget{
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}


// State class for DropDownMenu widget
class _DropDownMenuState extends State<DropDownMenu> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String startHourValue = hours.first;
  String startMeridiemValue = meridiem.first;
  String endHourValue = hours.last;
  String endMeridiemValue = meridiem.last;

  // Load time restriction values if previously set. Otherwise load default values.
  Future<void> _loadPreferences() async {
    final SharedPreferences prefs = await _prefs;
    
    setState(() {
      startHourValue =     prefs.getString('startHour') ?? hours.first;
      startMeridiemValue = prefs.getString('startMeridiem') ?? meridiem.first;
      endHourValue =       prefs.getString('endHour') ?? hours.first;
      endMeridiemValue =   prefs.getString('endMeridiem') ?? meridiem.first;
    });
  }

  void _savePreferences() async {
    final prefs = await _prefs;

    await prefs.setString('startHour', startHourValue);
    await prefs.setString('startMeridiem', startMeridiemValue);
    await prefs.setString('endHour', endHourValue);
    await prefs.setString('endMeridiem', endMeridiemValue);
  }

  @override
  void initState(){
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(

        children: [
          // Notification settings
          Padding(
            padding: const EdgeInsets.fromLTRB(0,20,0,8),
            child: ListTile( 
              leading: const Icon(Icons.notifications_outlined, size: 30,),
            
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Time restrictions settings
          ListTile( 
            leading: const Icon(Icons.timer_off_outlined, size: 30),

            title: Text(
              'Time Restrictions',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            
          ),

          // Drop down menus to specify times of no availability.
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(width: 75),

              // Start time dropdown
              DropdownButton( 
                value:     startHourValue,
                icon:      const Icon(Icons.arrow_drop_down),
                elevation: 10,
                style:     const TextStyle(color: Colors.black),
                underline: Container( 
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? value) {
                  setState(() {
                    startHourValue = value!;
                  });

                  _savePreferences();
                },
                items: hours.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(width: 10, ),

              // Meridiem dropdown for start time
              DropdownButton( 
                value:     startMeridiemValue,
                icon:      const Icon(Icons.arrow_drop_down),
                elevation: 10,
                style:     const TextStyle(color: Colors.black),
                underline: Container( 
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? value) {
                  setState(() {
                    startMeridiemValue = value!;
                  });

                  _savePreferences();
                },
                items: meridiem.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(width: 5, ),
              const Text('to', style: TextStyle(fontSize: 15),),
              const SizedBox(width: 8, ),

              // End time dropdown
              DropdownButton( 
                value:     endHourValue,
                icon:      const Icon(Icons.arrow_drop_down),
                elevation: 10,
                style:     const TextStyle(color: Colors.black),
                underline: Container( 
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? value) {
                  setState(() {
                    endHourValue = value!;
                  });

                  _savePreferences();
                },
                items: hours.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(width: 10, ),

              // Meridiem dropdown for end time
              DropdownButton( 
                value:     endMeridiemValue,
                icon:      const Icon(Icons.arrow_drop_down),
                elevation: 10,
                style:     const TextStyle(color: Colors.black),
                underline: Container( 
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? value){
                  setState(() {
                    endMeridiemValue = value!;
                  });

                  _savePreferences();
                },
                items: meridiem.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),

          
        ],
      ),
    );
  }
}