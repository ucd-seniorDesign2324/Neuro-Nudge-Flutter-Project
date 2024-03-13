import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffF5F5F5),
          brightness: Brightness.light,
        ),
        useMaterial3: false,
        
        
        textTheme: TextTheme( 
          titleLarge: GoogleFonts.poppins( 
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        )
      ),



      debugShowCheckedModeBanner: false,


      home: const HomePage(),
    );
  }
}
