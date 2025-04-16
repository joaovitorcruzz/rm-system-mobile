import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Reservas',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Minhas Reservas',
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          Card(
            color: Colors.white.withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: ListTile(
              leading: Icon(Icons.meeting_room, color: Colors.white),
              title: Text('Sala de Reunião 1', style: TextStyle(color: Colors.white)),
              subtitle: Text('Dia 20/04 às 14:00', style: TextStyle(color: Colors.white70)),
            ),
          ),
          const SizedBox(height: 12.0),
          Card(
            color: Colors.white.withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: ListTile(
              leading: Icon(Icons.meeting_room, color: Colors.white),
              title: Text('Sala de Treinamento', style: TextStyle(color: Colors.white)),
              subtitle: Text('Dia 25/04 às 10:00', style: TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }
}