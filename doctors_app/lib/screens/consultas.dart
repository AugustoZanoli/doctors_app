import 'package:doctors_app/components/card_user.dart';
import 'package:doctors_app/components/consultas/card_consultas.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Consultas extends StatelessWidget {
  const Consultas({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardsData = [
      {
        'title': 'Pediatra',
        'route': '/consultas',
        'medico': 'Antonio Marcos',
        'data': '13/05/2025',
        'status': 'Pendente',
      },
      {
        'title': 'Pediatra',
        'route': '/consultas',
        'medico': 'Antonio Marcos',
        'data': '01/05/2025',
        'status': 'Cancelada',
      },
      {
        'title': 'Dentista',
        'route': '/consultas',
        'medico': 'Adriano Oliveira',
        'data': '24/03/2025',
        'status': 'Concluída',
      },
      {
        'title': 'Consulta',
        'route': '/consultas',
        'medico': 'Ana Beatriz Silva',
        'data': '06/03/2025',
        'status': 'Concluída',
      },
      {
        'title': 'Consulta',
        'route': '/consultas',
        'medico': 'Ana Beatriz Silva',
        'data': '14/02/2025',
        'status': 'Concluída',
      },
      {
        'title': 'Oftamologista',
        'route': '/consultas',
        'medico': 'Mariana Pereira',
        'data': '01/02/2025',
        'status': 'Concluída',
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            color: customPurple,
          ),

          // Conteúdo sobreposto
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

                // Minha grid
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
          tooltip: 'Increment',
          onPressed: (){},
          child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
    );
  }
}
