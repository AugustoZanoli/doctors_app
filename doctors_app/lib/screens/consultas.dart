import 'package:doctors_app/components/consultas/cardConsultas.dart';
import 'package:doctors_app/db/consultasDb.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Consultas extends StatefulWidget {
  const Consultas({super.key});

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  int _selectedFilterIndex = 0; // 0 = Pendentes, 1 = Finalizados

  void _adicionarConsulta(Map<String, dynamic> novaConsulta) {
    setState(() {
      cardsData.insert(0, novaConsulta);
    });
  }

  List<Map<String, dynamic>> _filtrarConsultas() {
    if (_selectedFilterIndex == 0) {
      return cardsData.where((c) => c['status'] == 'Pendente').toList();
    } else {
      return cardsData.where((c) => c['status'] == 'Finalizado').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final consultasFiltradas = _filtrarConsultas();

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 32),
                  Text(
                    'Minhas Consultas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 12),
                  ToggleButtons(
                    isSelected: [
                      _selectedFilterIndex == 0,
                      _selectedFilterIndex == 1
                    ],
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: customTeal,
                    color: Colors.white,
                    fillColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                    onPressed: (index) {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Pendentes'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Finalizadas'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: consultasFiltradas.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_today,
                                        size: 60, color: Colors.grey.shade400),
                                    SizedBox(height: 12),
                                    Text(
                                      'Nenhuma consulta encontrada',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(bottom: 80),
                                itemCount: consultasFiltradas.length,
                                itemBuilder: (context, index) {
                                  final item = consultasFiltradas[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: CardConsultas(
                                      title: item['title'],
                                      route: item['route'],
                                      medico: item['medico'],
                                      data: item['data'],
                                      status: item['status'],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: customTeal,
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Nova Consulta', style: TextStyle(color: Colors.white)),
        onPressed: () async {
          final novaConsulta =
              await Navigator.pushNamed(context, '/novaconsulta');
          if (novaConsulta != null && novaConsulta is Map<String, dynamic>) {
            _adicionarConsulta(novaConsulta);
          }
        },
      ),
    );
  }
}
