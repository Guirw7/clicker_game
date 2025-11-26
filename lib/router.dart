import 'package:flutter/material.dart';

import 'pages/options_page.dart';
import 'pages/game_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/game':
        return MaterialPageRoute(builder: (_) => const GamePage());
      default:
        return MaterialPageRoute(builder: (_) => const OptionsPage());
    }
  }
}
