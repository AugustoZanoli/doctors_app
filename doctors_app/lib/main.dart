import 'package:doctors_app/components/bottomNavigationBar.dart';
import 'package:doctors_app/screens/consultas.dart';
import 'package:doctors_app/screens/login/login.dart';
import 'package:doctors_app/screens/novaConsulta.dart';
import 'package:doctors_app/screens/profissionais.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Consulta Médica',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: customTeal,
            primaryColor: customTeal,
            appBarTheme: AppBarTheme(color: customTeal)),
        home: LoginPage(),
        routes: {
          '/consultas': (context) => Consultas(),
          '/novaconsulta': (context) => Novaconsulta(),
          '/home': (context) => MainLayout(),
          '/profissionais': (context) => Profissionais(),
        });
  }
}

MaterialColor customTeal = const MaterialColor(
  0xFF009688, 
  <int, Color>{
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  },
);

