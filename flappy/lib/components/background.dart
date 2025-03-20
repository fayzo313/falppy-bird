import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy/game/assets.dart';
import 'package:flappy/game/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  // Store the three background sprites
  late Sprite background1;
  late Sprite background2;
  late Sprite background3;
  bool isLoaded = false; // Flag to track if backgrounds are loaded

  @override
  Future<void> onLoad() async {
    // Load all three background images
    background1 = Sprite(await Flame.images.load(Assets.backgorund));
    background2 = Sprite(await Flame.images.load(Assets.backgorund1));
    background3 = Sprite(await Flame.images.load(Assets.backgorund2));
    background3 = Sprite(await Flame.images.load(Assets.backgorund3));

    // Set initial size and sprite
    size = gameRef.size;
    sprite = background1; // Start with the first background
    isLoaded = true; // Mark as loaded
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Only update the sprite if backgrounds are loaded
    if (isLoaded) {
      int score = gameRef.bird.score;
      if (score < 2) {
        sprite = background1; // First background for score 0-1
      } else if (score < 4) {
        sprite = background2; // Second background for score 2-3
      } else {
        sprite = background3; // Third background for score 4+
      }
    }
  }
}
