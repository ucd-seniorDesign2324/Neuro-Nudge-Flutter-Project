import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nn/presentation/daily_view.dart';
import 'package:nn/presentation/settings_page.dart';
import 'package:nn/presentation/home_page.dart';
import 'package:nn/presentation/monthly_view.dart';
import 'package:nn/presentation/import_calendar_page.dart';


Drawer drawerMenuBuilder(BuildContext context) {
    return Drawer( 
        child: Column( 
          children: [
            const Gap(75), // Space between top of screen and menu
            
            const Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),

              // Navigation to daily view which is just the home screen so idk. 
            ListTile( 
              leading: const Icon(
                Icons.calendar_today,
                size: 40
                ),
              title: const Center(
                child: Text(
                  'Daily',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0)
                  )
                ),

              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DailyView()),
                );
              },
            ),
              
              // Navigation to monthly view
            ListTile( 
              leading: const Icon(
                Icons.calendar_month,
                size: 40
                ),
              title: const Center(
                child: Text(
                  'Monthly',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0)
                  )
                ),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MonthlyView()),
                );
              }
            ),
            
            const Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),

              // Navigation to home page
            ListTile( 
              leading: const Icon(
                Icons.home_outlined,
                size: 40
                ),
              title: const Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0)
                  )
                ),
                onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            ),

              // Navigation to profile
            ListTile( 
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 40
                ),
              title: const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0)
                  )
                ),
                onTap: (){
                Navigator.pop(context);
                },
            ),
            ListTile(
              leading: const Icon(
                Icons.import_contacts,
                size: 40,
              ),
              title: const Center(
                child: Text(
                  'Import',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                  )
                )
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImportCalendarPage()),
                );
              },
            ),

            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  // Navigation to settings page
                  ListTile( 
                    leading: const Icon(
                      Icons.settings,
                      size: 40
                      ),
                    title: const Center(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0)
                        )
                      ),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsPage()),
                        );
                      }
                    ),
            

                  // Navigation to help page
                  ListTile( 
                      leading: const Icon(
                        Icons.help_outline,
                        size: 40
                        ),
                      title: const Center(
                        child: Text(
                          'Help',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)
                          )
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        }
                      ),
                ],
              )
            )
          ],
        )
      );
  }