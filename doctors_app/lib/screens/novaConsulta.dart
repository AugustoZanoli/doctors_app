import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';

class Novaconsulta extends StatefulWidget {
  const Novaconsulta({super.key});

  @override
  State<Novaconsulta> createState() => _NovaconsultaState();
}

class _NovaconsultaState extends State<Novaconsulta> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _medicoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _especialidadeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Marcar Consulta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(Icons.calendar_today, size: 64, color: customTeal),
                    SizedBox(height: 12),
                    Text(
                      'Preencha os dados da nova consulta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: _medicoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome do Médico',
                        hintText: 'Nome do Médico',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Informe o nome do médico'
                          : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _dataController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data da Consulta',
                        hintText: 'XX/XX/XXXX',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Informe a data'
                          : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _especialidadeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Especialidade',
                        hintText: 'Ex: Pediatra',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
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
                        label: Text('Adicionar consulta', style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customTeal,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          textStyle: TextStyle(fontSize: 16),
                          
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final novaConsulta = {
                              'title': _especialidadeController.text,
                              'route': '/consultas',
                              'medico': _medicoController.text,
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
      ),
    );
  }
}
