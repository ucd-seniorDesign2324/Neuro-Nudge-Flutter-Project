/*
  This Dart code is the entry point of a Flutter application. 
  It initializes Supabase with credentials and signs in with a username and password. 
  Once authenticated, it runs the application with the MyApp widget as the root of the widget tree. 
  The MyApp widget is a MaterialApp that sets up the application title, theme, and initial route to the HomePage.
 */

import 'package:flutter/material.dart';
import 'package:nn/presentation/home_page.dart';
import 'package:nn/presentation/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Entry point of the application
void main() async {
  print('loading app');
  
  // Initialize Supabase with credentials
  Supabase.initialize(
    url: 'https://fgocfoakntmlhgtftrzh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnb2Nmb2FrbnRtbGhndGZ0cnpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2ODkyMTUsImV4cCI6MjAyNzI2NTIxNX0.s5dAWy-DSa1EBfKjhpGOOcax6S7QUsh7xCHPFgKlBn8',
  );

  // Sign in with Supabase credentials
  final AuthResponse res = await supabase.auth.signInWithPassword(
    email: 'neuro.nudger@gmail.com',
    password: 'Vatican1-Cameos3',
  );
  final Session? session = res.session; // Session after sign-in
  final User? user = res.user; // User information

  // Run the application with ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client; // Supabase client instance

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Neuro Nudge'; // Application title
    return MaterialApp(
      title: appTitle,
      theme: appThemeData, // Application theme
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: const HomePage(), // Initial route is HomePage
    );
  }
}
