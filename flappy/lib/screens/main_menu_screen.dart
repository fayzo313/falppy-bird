import 'package:flappy/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'flappy bird',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF37394F),
                  fontFamily: 'jersy',
                ),
              ),
              Image.asset('assets/images/bird_up.png', width: 194),
              Container(
                width: 203,
                height: 46,
                decoration: BoxDecoration(
                  color: Color(0xFF37394F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: const Text(
                    'Play Game',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ), // Text style
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
