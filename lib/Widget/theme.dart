import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData  lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
         cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBlue,
        accentColor: darkBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme:AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          //foregroundColor: Colors.black,    
        )
  );

  static ThemeData  darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        buttonColor: lightBlue,
        accentColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          //foregroundColor: Colors.white,    
        )
  );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBlue = const Color(0xff403b58);
  static Color lightBlue = Vx.indigo500;
}