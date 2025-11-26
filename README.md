# 🎮 Clicker Game – Flutter

Un mini-jeu de type *Clicker* développé en **Flutter**, utilisant :

- **Material 3** pour un design moderne  
- **Provider + ChangeNotifier** pour la gestion d’état  
- **SharedPreferences** pour la sauvegarde locale  
- **Router personnalisé** pour la navigation entre plusieurs pages  

Ce projet a été réalisé dans le cadre du **TP Flutter** (ESGI 2ᵉ année).

---

## ✨ Fonctionnalités principales

### 🏠 Page Options
- Saisie du **pseudo de l'utilisateur**
- Affichage :
  - Score actuel
  - Niveau d’auto-click
- Bouton pour **réinitialiser la partie**
- Navigation vers la page du jeu

### 🎮 Page Jeu
- Gros bouton **“CLIQUER”** → +1 point par clic
- Score mis à jour **en temps réel**
- Système d’auto-click évolutif :
  - **Niveau 0** → pas d’auto-click  
  - **Niveau 1** → +1 point toutes les 10 secondes (débloqué à **10 points**)  
  - **Niveau 2** → +2 points toutes les 5 secondes (débloqué à **25 points**)  

---

## 💾 Sauvegarde locale

Grâce à `SharedPreferences`, les données suivantes sont **automatiquement sauvegardées** :

- ✔ Score  
- ✔ Pseudo  
- ✔ Niveau d’auto-click  

L’application recharge également les données au démarrage et relance le compteur automatique si besoin.

---

## 🛠 Stack technique

- **Flutter 3.x**
- **Material 3**
- **Provider / ChangeNotifier**
- **SharedPreferences**
- Widgets Material :  
  `Scaffold`, `Card`, `TextFormField`, `FilledButton`, `TextButton`, `Icon`, etc.

---

## 📁 Structure du projet

```md
📁 lib  
 ├── 📂 providers  
 │     └── 📄 game_provider.dart  
 ├── 📂 pages  
 │     ├── 📄 options_page.dart  
 │     └── 📄 game_page.dart  
 ├── 📄 router.dart  
 └── 📄 main.dart
```


---

## 🚀 Installation & exécution

### 1️⃣ Cloner le projet
```bash
git clone https://github.com/Guirw7/clicker_game.git
cd clicker_game
