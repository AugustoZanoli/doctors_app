import 'package:flutter/material.dart';

class Novaconsulta extends StatelessWidget {
  const Novaconsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Marcar Consulta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
      body: Center(
        child: Text('Nova Consulta'),
      ),
    );
  }
}