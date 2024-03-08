import 'package:flutter/material.dart';
import 'package:nn/settings_page.dart';
import 'package:nn/home_page.dart';

Drawer drawerMenuBuilder(BuildContext context) {
    return Drawer( 
        child: Column( 
          children: [
            const SizedBox(height: 75,),
            const Divider(),

            // 
            ListTile( 
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
              },
            ),
              
            ListTile( 
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
              }
            ),
            
            const Divider(),

            ListTile( 
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

            ListTile( 
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
              }
            ),

            const SizedBox(height: 230,),

            Expanded(
              child: Column(
                children: [
                  Align( 
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile( 
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
                  ),

                  Align( 
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile( 
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
                    ),
                ],
              )
            )
          ],
        )
      );
  }