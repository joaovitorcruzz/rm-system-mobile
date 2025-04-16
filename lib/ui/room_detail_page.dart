import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class RoomDetailPage extends StatelessWidget {
  final String name;
  final int capacity;

  const RoomDetailPage({super.key, required this.name, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detalhes da sala',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            'Nome: $name',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Capacidade: $capacity pessoas',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}