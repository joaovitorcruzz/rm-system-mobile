import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Configurações",
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Opções de Configuração",
              style: theme.textTheme.headlineLarge?.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(
                "Alterar tema",
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 23),
              ),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                "Idioma",
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 23),
              ),
              onTap: () {
                // Ação para configurações de idioma
              },
            ),
          ],
        ),
      ),
    );
  }
}
