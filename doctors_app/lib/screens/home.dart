import 'package:doctors_app/components/grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> cardsData = [
    {
      'title': 'Consultas',
      'icon': Icons.calendar_today,
      'route': '/consultas',
    },
    {
      'title': 'Médicos',
      'icon': Icons.local_hospital,
      'route': '/medicos',
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                    route: item['title'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
