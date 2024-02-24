

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle(
    {double fontSize = 25,
    FontWeight fontWeight = FontWeight.w900,
    Color color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getbodyStyle(
    {double fontSize = 20,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
      
}
TextStyle getsmallStyle(
    {double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
    }