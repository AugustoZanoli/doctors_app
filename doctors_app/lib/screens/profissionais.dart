import 'package:doctors_app/components/appBar.dart';
import 'package:doctors_app/components/profissionais/cardGridProfissionais.dart';
import 'package:doctors_app/components/profissionais/cardProfissionais.dart';
import 'package:doctors_app/db/profissionaisDb.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Profissionais extends StatefulWidget {
  const Profissionais({super.key});

  @override
  State<Profissionais> createState() => _ProfissionaisState();
}

class _ProfissionaisState extends State<Profissionais> {
  bool isList = true;
  bool isOpen = false;
  String? filtroArea;

  List<Map<String, dynamic>> get profissionaisFiltrados {
    if (filtroArea == null) return profissionais;
    return profissionais.where((p) => p['area'] == filtroArea).toList();
  }

  void abrirModalFiltro() {
    final areas =
        profissionais.map((p) => p['area'] as String).toSet().toList();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.clear),
                  title: Text('Remover filtro'),
                  onTap: () {
                    setState(() {
                      filtroArea = null;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ...areas.map((area) {
                  return ListTile(
                    title: Text(area),
                    onTap: () {
                      setState(() {
                        filtroArea = area;
                      });
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profissionais'),
      body: Column(
  children: [
    if (filtroArea != null)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text('Filtro: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Chip(
              label: Text(filtroArea!),
              deleteIcon: Icon(Icons.clear),
              onDeleted: () {
                setState(() {
                  filtroArea = null;
                });
              },
            ),
          ],
        ),
      ),
    Expanded(
      child: profissionaisFiltrados.isEmpty
          ? Center(child: Text('Nenhum profissional encontrado.'))
          : isList
              ? ListView.builder(
                  itemCount: profissionaisFiltrados.length,
                  itemBuilder: (context, index) {
                    final item = profissionaisFiltrados[index];
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
                  itemCount: profissionaisFiltrados.length,
                  itemBuilder: (context, index) {
                    final item = profissionaisFiltrados[index];
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

      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (isOpen) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: FloatingActionButton(
                backgroundColor: customTeal,
                mini: true,
                child: Icon(Icons.filter_alt, color: Colors.white),
                onPressed: () {
                  abrirModalFiltro();
                  setState(() {
                    isOpen = false;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 130.0),
              child: FloatingActionButton(
                backgroundColor: customTeal,
                mini: true,
                child: Icon(isList ? Icons.grid_on : Icons.list, color: Colors.white),
                onPressed: () {
                  setState(() {
                    isList = !isList;
                    isOpen = false;
                  });
                },
              ),
            ),
          ],
          FloatingActionButton(
            backgroundColor: customTeal,
            child: Icon(isOpen ? Icons.close : Icons.add, color: Colors.white),
            onPressed: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}
