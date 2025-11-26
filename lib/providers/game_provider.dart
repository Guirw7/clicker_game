import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  int score = 0;
  String username = '';
  int autoClickLevel = 0;
  Timer? _autoClickTimer;

  GameProvider() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    score = prefs.getInt('score') ?? 0;
    username = prefs.getString('username') ?? '';
    autoClickLevel = prefs.getInt('autoClickLevel') ?? 0;

    // On relance la machine automatique si elle était déjà débloquée
    if (autoClickLevel == 1) {
      _startAutoClickTimer(10);
    } else if (autoClickLevel >= 2) {
      _startAutoClickTimer(5);
    }

    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
    await prefs.setString('username', username);
    await prefs.setInt('autoClickLevel', autoClickLevel);
  }

  void setUsername(String name) {
    username = name;
    _saveToPrefs();
    notifyListeners();
  }

  void resetGame() {
    score = 0;
    autoClickLevel = 0;
    _autoClickTimer?.cancel();
    _saveToPrefs();
    notifyListeners();
  }

  void manualClick() {
    score++;
    _checkUnlocks();
    _saveToPrefs();
    notifyListeners();
  }

  void _checkUnlocks() {
    // Déblocage de la première machine auto
    if (score >= 10 && autoClickLevel == 0) {
      autoClickLevel = 1;
      _startAutoClickTimer(10);
    }

    // Amélioration de la machine
    if (score >= 25 && autoClickLevel == 1) {
      autoClickLevel = 2;
      _startAutoClickTimer(5);
    }
  }

  void _startAutoClickTimer(int seconds) {
    _autoClickTimer?.cancel();

    _autoClickTimer = Timer.periodic(
      Duration(seconds: seconds),
      (timer) async {
        score += autoClickLevel;
        await _saveToPrefs();
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _autoClickTimer?.cancel();
    super.dispose();
  }
}
