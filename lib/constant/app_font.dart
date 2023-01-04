import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Font {
  static title1({Color color = Colors.white}) =>
      GoogleFonts.lato(fontSize: 22, color: color, fontWeight: FontWeight.w600);

  static title2({Color color = Colors.white}) =>
      TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w500);

  static subTitle1({Color color = Colors.white}) =>
      TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w400);

  static button1({Color color = Colors.white}) =>
      TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w500);
}
