class User {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String birthDate;
  final String city;
  final String about;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.birthDate,
    required this.city,
    required this.about,
  });
}

final List<User> users = [
  User(
      name: 'Teste',
      email: 'teste',
      password: '12345',
      phone: '(35)99999-9999',
      birthDate: '01/01/2025',
      city: 'Itajubá',
      about:
          'Esse é um login de usuário teste, apenas para fins demonstrativos.'),
];
