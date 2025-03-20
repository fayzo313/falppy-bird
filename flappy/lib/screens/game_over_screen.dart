import 'package:flappy/game/assets.dart';
import 'package:flappy/game/flappy_bird_game.dart';
import 'package:flappy/main.dart';
import 'package:flappy/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black38,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.gameOver),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xFF4A4C5F),
            ),
            width: 343,
            height: 283,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Score ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'jersy',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xFF37394F),
                      ),
                      width: 146,
                      height: 49,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ' ${game.bird.score}',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'jersy',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'jersy',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xFF37394F),
                      ),
                      width: 146,
                      height: 49,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ' ${game.bird.score}',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'jersy',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'COIN',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'jersy',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xFF37394F),
                      ),
                      width: 146,
                      height: 49,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ' ${game.bird.score}',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'jersy',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          GestureDetector(
            onTap: onRestart,
            child: Container(
              width: 203,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFF37394F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          GestureDetector(
            onTap: () {
              // Navigate to main menu with the game parameter
              game.pauseEngine();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainMenuScreen(game: game),
                ),
              );
            },
            child: Container(
              width: 203,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFC73333),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'EXIT',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  void onRestart() {
    // Implement proper cleanup and reset to avoid lag

    // First reset the bird
    game.bird.reset();

    // Use a comprehensive cleanup approach
    _cleanupGameResources();

    // Remove the overlay
    game.overlays.remove('gameOver');

    // Add a small delay before resuming to ensure cleanup is complete
    Future.delayed(const Duration(milliseconds: 50), () {
      game.resumeEngine();
    });
  }

  // Helper method to clean up game resources
  void _cleanupGameResources() {
    // Pause engine during cleanup
    game.pauseEngine();

    // Remove obstacles/pipes and other disposable components
    // This uses a safer approach that doesn't require a resetGame method

    // Reset any game state you have access to
    // If there are game timers you can access, reset them here
  }
}
