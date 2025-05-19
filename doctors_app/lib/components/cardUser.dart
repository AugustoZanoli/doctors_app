import 'package:flutter/material.dart';
import 'package:doctors_app/main.dart';

class CardUser extends StatefulWidget {
  final String title;
  final String route;
  final String data;

  const CardUser({
    super.key,
    required this.title,
    required this.route,
    required this.data,
  });

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: customTeal[400],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      isOpen ? 'Data de nascimento: ${widget.data}' : 'Data de nascimento: ************',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isOpen ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
