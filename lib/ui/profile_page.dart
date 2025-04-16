import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Perfil',
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50.0, color: Colors.grey),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Nome do Usuário',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'email@exemplo.com',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 14.0),
            ),
            child: const Text('Sair', style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
    );
  }
}