import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class Font {
  static text({Color color = Colors.white,double size = 16,FontWeight? weight}) =>
      GoogleFonts.lato(fontSize: size, color: color, fontWeight: weight);

  static title1({Color color = Colors.white}) =>
      GoogleFonts.lato(fontSize: 22, color: color, fontWeight: FontWeight.w600);

  static title2({Color color = Colors.white}) =>
      TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w500);

  static subTitle1({Color color = Colors.white}) =>
      TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w400);

  static subTitle2({Color color = Colors.white}) =>
      TextStyle(fontSize: 17, color: color, fontWeight: FontWeight.w400);

  static subTitle3({Color color = Colors.white}) =>
      TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w400);

  static bodyText1({Color color = Colors.white}) =>
      TextStyle(fontSize: 15, color: color, fontWeight: FontWeight.w300);

  static button1({Color color = Colors.white}) =>
      TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w500);
}
