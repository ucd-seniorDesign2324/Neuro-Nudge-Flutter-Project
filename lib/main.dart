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
      debugShowCheckedModeBanner: false,
      home: HomePage(items: List<String>.generate(10000, (i) => 'Item $i')),
    );
  }
}

