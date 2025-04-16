import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Início',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bem-vindo ao RM Systems!',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          SizedBox(height: 12.0),
          Text(
            'Use o menu lateral para acessar seu perfil, reservas ou salas disponíveis.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}