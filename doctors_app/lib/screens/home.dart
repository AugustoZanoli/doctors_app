import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo ao app de consulta médica!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
