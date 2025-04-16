import 'package:flutter/material.dart';
import 'app_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const BaseScaffold({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fundo gradiente que ocupa toda a tela, inclusive atrás da AppBar
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        // Conteúdo principal com AppBar e Drawer
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const AppDrawer(),
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}