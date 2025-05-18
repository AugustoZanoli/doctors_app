import 'package:doctors_app/components/appBar.dart';
import 'package:doctors_app/components/profissionais/cardProfissionais.dart';
import 'package:doctors_app/db/profissionaisDb.dart';
import 'package:flutter/material.dart';

class Profissionais extends StatefulWidget {
  const Profissionais({super.key});

  @override
  State<Profissionais> createState() => _ProfissionaisState();
}

class _ProfissionaisState extends State<Profissionais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profissionais'),
      body: ListView.builder(
        itemCount: profissionais.length,
        itemBuilder: (context, index) {
          final item = profissionais[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Cardprofissionais(
              nome: item['nome'],
              area: item['area'],
              regiao: item['regiao'],
              foto: item['foto'],
            ),
          );
        },
      ),
    );
  }
}
