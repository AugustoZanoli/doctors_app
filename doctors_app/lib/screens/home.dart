import 'package:doctors_app/components/cardUser.dart';
import 'package:doctors_app/components/grid/grid.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> cardsData = [
    {
      'title': 'Consultas',
      'icon': Icons.calendar_today,
      'route': '/consultas',
    },
    {
      'title': 'Profissionais',
      'icon': Icons.local_hospital,
      'route': '/profissionais',
    },
    {
      'title': 'Especialidades',
      'icon': Icons.category,
      'route': '/especialidades',
    },
    {
      'title': 'Configurações',
      'icon': Icons.settings,
      'route': '/configuracoes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Página Inicial'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Consultas'),
              onTap: () {
                Navigator.pushNamed(context, '/consultas');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: customTeal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),

          // Conteúdo sobreposto
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 32),

                CardUser(),

                // Minha grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final item = cardsData[index];
                      return GridCard(
                        title: item['title'],
                        icon: item['icon'],
                        route: item['route'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
