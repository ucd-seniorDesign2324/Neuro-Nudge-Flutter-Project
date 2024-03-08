import 'package:flutter/material.dart';
import 'package:nn/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const String appTitle = 'Neuro Nudge';
    return MaterialApp(
      
      
      title: appTitle,

      
      // Basic theme. Will be modified down the road.
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardTheme(color: Colors.blue.shade50),
        useMaterial3: true,
      ),


      debugShowCheckedModeBanner: false,


      home: HomePage(),
    );
  }
}
