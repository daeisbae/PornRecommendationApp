import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color white = Colors.white;
Color deepPink = Color(0xfffc3196);
Color lightPink = Color(0xFFFF87CA);
Color lightPink50 = Color(0x77FF87CA);
Color lightPurpleBackground = Color(0xFFF6D5FF);
Color lightPurple = Color(0xFFD47AE8);
Color deepPurple = Color(0xFF8045F2);

LinearGradient purpleGradientColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [deepPurple, lightPurple]);
LinearGradient pinkGradientColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [deepPink, lightPink]);

TextStyle strokeText(Color color, double fontSize) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      textStyle: TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0
            ..color = color));
}

TextStyle noStrokeText(Color color, double fontSize) {
  return GoogleFonts.roboto(color: color, fontSize: fontSize);
}

Stack fillStrokeText(String text, Color color, double fontSize) {
  return Stack(
    children: [
      Text(text, style: strokeText(color, fontSize)),
      Text(text, style: noStrokeText(color, fontSize)),
    ],
  );
}

// TextStyle lightPurpleRoboto24 = GoogleFonts.roboto(color: lightPurple, fontSize: 24, fontWeight: FontWeight.w500);
// TextStyle lightPurpleRoboto18 = GoogleFonts.roboto(color: lightPurple, fontSize: 18);

ThemeData defaultTheme() {
  return ThemeData(
    scaffoldBackgroundColor: lightPurpleBackground,
  );
}
