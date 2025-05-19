import 'package:flutter/material.dart';

class CardGridProfissional extends StatelessWidget {
  final String nome;
  final String area;
  final String regiao;
  final String foto;
  final double avaliacao;
  final List<String> descavaliacao;
  final String descricao;

  const CardGridProfissional({
    super.key,
    required this.nome,
    required this.area,
    required this.regiao,
    required this.foto,
    required this.avaliacao,
    required this.descavaliacao,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/profissionalDetails', arguments: {
          'nome': nome,
          'area': area,
          'regiao': regiao,
          'foto': foto,
          'avaliacao': avaliacao,
          'descricao': descricao,
          'descavaliacao': descavaliacao,
        });
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(foto)),
          title: Text(nome),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(area),
              Text(regiao),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < avaliacao.floor() ? Icons.star : Icons.star_border,
                    size: 16,
                    color: Colors.orange,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
