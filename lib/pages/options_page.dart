import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue${game.username.isNotEmpty ? ', ${game.username}' : ''} 👋',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Configure ton pseudo et consulte l’état de ta partie.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              // Carte pseudo
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pseudo',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: game.username,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ton pseudo',
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: game.setUsername,
                      ),
                    ],
                  ),
                ),
              ),

              // Carte stats
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.analytics),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Statut de la partie',
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Score : ${game.score}\n'
                              'Auto-click niveau : ${game.autoClickLevel}',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: game.resetGame,
                        icon: const Icon(Icons.restart_alt),
                        tooltip: 'Réinitialiser la partie',
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              Center(
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Lancer le jeu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
