import 'package:doctors_app/components/appBar.dart';
import 'package:doctors_app/components/profissionais/cardGridProfissionais.dart';
import 'package:doctors_app/components/profissionais/cardProfissionais.dart';
import 'package:doctors_app/db/profissionaisDb.dart';
import 'package:flutter/material.dart';

class Profissionais extends StatefulWidget {
  const Profissionais({super.key});

  @override
  State<Profissionais> createState() => _ProfissionaisState();
}

class _ProfissionaisState extends State<Profissionais> {
  bool isList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profissionais'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isList = !isList;
                  });
                },
                icon: isList ? Icon(Icons.grid_on) : Icon(Icons.list),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_rounded))
            ],
          ),
          Expanded(
            child: isList
                ? ListView.builder(
                    itemCount: profissionais.length,
                    itemBuilder: (context, index) {
                      final item = profissionais[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Cardprofissionais(
                          nome: item['nome'],
                          area: item['area'],
                          regiao: item['regiao'],
                          foto: item['foto'],
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: profissionais.length,
                    itemBuilder: (context, index) {
                      final item = profissionais[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: CardGridProfissionais(
                          nome: item['nome'],
                          area: item['area'],
                          regiao: item['regiao'],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
