import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy/game/flappy_bird_game.dart';
import 'package:flappy/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/game_over_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = FlappyBirdGame();

    return MaterialApp(
      title: 'Flappy Bird',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GameWidget(
        game: game,
        initialActiveOverlays: const [MainMenuScreen.id],
        overlayBuilderMap: {
          'mainMenu': (context, _) => MainMenuScreen(game: game),
          'gameOver': (context, _) => GameOverScreen(game: game),
        },
      ),
    );
  }
}
