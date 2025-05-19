import 'package:doctors_app/components/appBar.dart';
import 'package:doctors_app/db/profissionaisDb.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Novaconsulta extends StatefulWidget {
  const Novaconsulta({super.key});

  @override
  State<Novaconsulta> createState() => _NovaconsultaState();
}

class _NovaconsultaState extends State<Novaconsulta> {
  final _formKey = GlobalKey<FormState>();
  String? _medicoSelecionado;
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _especialidadeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyAppBar(
        title: 'Marcar Consulta',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  
                  
                  SizedBox(height: 16),
                  Text(
                    'Preencha os dados da nova consulta',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: _medicoSelecionado,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Médico',
                    ),
                    hint: Text('Selecione o médico'),
                    items: profissionais.map((prof) {
                      return DropdownMenuItem<String>(
                        value: prof['nome'],
                        child: Text(prof['nome']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _medicoSelecionado = value;
                        final profissionalSelecionado =
                            profissionais.firstWhere(
                          (prof) => prof['nome'] == value,
                          orElse: () => {'area': ''},
                        );
                        _especialidadeController.text =
                            profissionalSelecionado['area'] ?? '';
                      });
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? 'Selecione um médico'
                        : null,
                  ),
                  
                  SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    controller: _dataController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data da Consulta',
                      hintText: 'Selecionar data',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (picked != null) {
                        setState(() {
                          _dataController.text =
                              '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
                        });
                      }
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? 'Informe a data'
                        : null,
                  ),
                  
                  SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    controller: _especialidadeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(),
                      labelText: 'Especialidade',
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Informe a especialidade'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Adicionar consulta',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: customTeal,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final novaConsulta = {
                            'title': _especialidadeController.text,
                            'route': '/consultas',
                            'medico': _medicoSelecionado,
                            'data': _dataController.text,
                            'status': 'Pendente',
                          };
                          Navigator.pop(context, novaConsulta);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
