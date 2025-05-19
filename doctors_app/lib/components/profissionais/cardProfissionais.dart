import 'package:flutter/material.dart';

class Cardprofissionais extends StatelessWidget {
  final String nome;
  final String area;
  final String regiao;
  final String foto;
  final double avaliacao;
  final List<String> descavaliacao;
  final String descricao;

  const Cardprofissionais({
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
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              foto,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          area,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        regiao,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < avaliacao.floor()
                            ? Icons.star
                            : Icons.star_border,
                        size: 16,
                        color: Colors.orange,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
