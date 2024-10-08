import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
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
    bodyMedium: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.bold
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
  ),


  searchBarTheme: const SearchBarThemeData( 
    hintStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
    padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0))
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 5,
      textStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold
        ),
      side: const BorderSide(width: 70.0),
    ))

);