import 'package:doctors_app/components/cardUser.dart';
import 'package:doctors_app/components/consultas/cardConsultas.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Consultas extends StatefulWidget {
  const Consultas({super.key});

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  List<Map<String, dynamic>> cardsData = [
    {
      'title': 'Pediatra',
      'route': '/consultas',
      'medico': 'Antonio Marcos',
      'data': '13/05/2025',
      'status': 'Pendente',
    },
  ];

  void _adicionarConsulta(Map<String, dynamic> novaConsulta) {
    setState(() {
      cardsData.insert(0, novaConsulta); // adiciona no topo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 200, color: customPurple),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 32),
                CardUser(
                  title: 'Augusto De C. Zanoli',
                  route: '',
                  data: '08/08/2004',
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cardsData.length,
                    itemBuilder: (context, index) {
                      final item = cardsData[index];
                      return CardConsultas(
                        title: item['title'],
                        route: item['route'],
                        medico: item['medico'],
                        data: item['data'],
                        status: item['status'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customPurple[400],
        tooltip: 'Nova Consulta',
        onPressed: () async {
          final novaConsulta = await Navigator.pushNamed(context, '/novaconsulta');
          if (novaConsulta != null && novaConsulta is Map<String, dynamic>) {
            _adicionarConsulta(novaConsulta);
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
