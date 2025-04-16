import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Salas',
      child: Column(
        children: [
          RoomTile(name: 'Sala de Reunião 1', capacity: 10),
          RoomTile(name: 'Sala de Conferência', capacity: 25),
          RoomTile(name: 'Sala de Treinamento', capacity: 15),
        ],
      ),
    );
  }
}

class RoomTile extends StatelessWidget {
  final String name;
  final int capacity;

  const RoomTile({
    super.key,
    required this.name,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.meeting_room_outlined, color: Colors.white),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text('Capacidade: $capacity pessoas', style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16.0),
        onTap: () {
          // Ação ao tocar na sala
        },
      ),
    );
  }
}