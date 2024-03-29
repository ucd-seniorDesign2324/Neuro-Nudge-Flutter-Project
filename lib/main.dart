import 'package:flutter/material.dart';
import 'package:nn/presentation/home_page.dart';
import 'package:nn/presentation/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
    DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const String appTitle = 'Neuro Nudge';
    return MaterialApp(
      title: appTitle,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
