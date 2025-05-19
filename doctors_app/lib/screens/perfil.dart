import 'package:doctors_app/db/consultasDb.dart';
import 'package:doctors_app/main.dart';
import 'package:flutter/material.dart';
import 'package:doctors_app/db/session.dart' as session;

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    int pendentes = cardsData.where((c) => c['status'] == 'Pendente').length;
    final user = session.loggedUser!;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.name ?? 'Usuário',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Paciente desde 2024',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                      Icons.calendar_today, cardsData.length, 'Consultas'),
                  _buildStatCard(Icons.access_time, pendentes, 'Pendentes'),
                  _buildStatCard(Icons.star, 5, 'Avaliações'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Informações Pessoais'),
            _buildInfoTile(Icons.email, user?.email ?? ''),
            _buildInfoTile(Icons.phone, user?.phone ?? ''),
            _buildInfoTile(Icons.cake, user?.birthDate ?? ''),
            _buildInfoTile(Icons.location_city, user?.city ?? ''),
            const SizedBox(height: 24),
            _buildSectionTitle('Sobre mim'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                user.about,
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Outras opções'),
            _buildInfoTile(Icons.settings, 'Configurações'),
            buildLogoutButton(
              () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, int value, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.teal.withOpacity(0.2),
          child: Icon(icon, color: customTeal),
        ),
        const SizedBox(height: 6),
        Text(value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(icon, color: customTeal),
          title: Text(text),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.teal[700]),
        ),
      ),
    );
  }

  Widget buildLogoutButton(VoidCallback onLogout) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onLogout,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.logout, color: customTeal),
                SizedBox(width: 16),
                Text(
                  'Sair',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
