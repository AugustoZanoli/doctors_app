import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta Médica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPurple,
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(color: customPurple)
      ),
      home: Home(),
    );
  }
}

MaterialColor customPurple = const MaterialColor(
  0xFF6B0096, // valor principal
  <int, Color>{
    50: Color(0xFFEBDCF2),
    100: Color(0xFFD6B9E5),
    200: Color(0xFFC093D7),
    300: Color(0xFFAA6DC9),
    400: Color(0xFF984DC0),
    500: Color(0xFF6B0096), // cor base
    600: Color(0xFF600087),
    700: Color(0xFF550078),
    800: Color(0xFF4A0069),
    900: Color(0xFF38004C),
  },
);
