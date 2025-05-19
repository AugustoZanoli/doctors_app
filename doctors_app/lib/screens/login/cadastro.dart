import 'package:doctors_app/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:doctors_app/db/userDb.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  bool registerUser(String name, String email, String password, String phone,
      String birthDate, String city, String about) {
    bool exists = users.any((user) => user.email == email);
    if (exists) {
      return false;
    } else {
      users.add(User(
        name: name,
        email: email,
        password: password,
        phone: phone,
        birthDate: birthDate,
        city: city,
        about: about,
      ));
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Cadastro'),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: birthDateController,
              decoration: InputDecoration(
                labelText: 'Data de nascimento',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'dd/mm/aaaa',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Cidade',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: aboutController,
              decoration: InputDecoration(
                labelText: 'Sobre',
                prefixIcon: Icon(Icons.info_outline),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String phone = phoneController.text.trim();
                String birthDate = birthDateController.text.trim();
                String city = cityController.text.trim();
                String password = passwordController.text.trim();
                String about = aboutController.text.trim();

                if (name.isEmpty ||
                    email.isEmpty ||
                    phone.isEmpty ||
                    birthDate.isEmpty ||
                    city.isEmpty ||
                    password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Por favor, preencha todos os campos')),
                  );
                  return;
                }

                if (registerUser(
                    name, email, password, phone, birthDate, city, about)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cadastro realizado com sucesso!')),
                  );
                  Navigator.pop(context); // volta para o login
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email já cadastrado. Faça login.')),
                  );
                }
              },
              child: Text('Cadastrar',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
