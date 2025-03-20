import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy/game/configuration.dart';
import 'package:flappy/game/flappy_bird_game.dart';
import 'package:flappy/game/pipe_position.dart';
import 'package:flutter/material.dart';

class Pipe extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required this.pipePosition, required this.height});

  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    size = Vector2(80, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        break;
    }

    add(
      RectangleComponent(
        size: Vector2(80, height - 40),
        position: Vector2(0, pipePosition == PipePosition.top ? 0 : 40),
        paint:
            Paint()
              ..shader = LinearGradient(
                colors: [Color(0xFF6B7280), Color(0xFF4A4E69)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, 80, height - 40)),
      ),
    );

    add(
      RectangleComponent(
        size: Vector2(100, 40),
        position: Vector2(
          -10,
          pipePosition == PipePosition.top ? height - 40 : 0,
        ),
        paint:
            Paint()
              ..color = Color(0xFF4A4E69)
              ..style = PaintingStyle.fill,
      ),
    );

    add(RectangleHitbox(size: Vector2(100, height), position: Vector2(-10, 0)));
  }
}

// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/flame.dart';
// import 'package:flappy/game/assets.dart';
// import 'package:flappy/game/configuration.dart';
// import 'package:flappy/game/flappy_bird_game.dart';
// import 'package:flappy/game/pipe_position.dart';

// class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
//   Pipe({required this.pipePosition, required this.height});

//   @override
//   final double height;
//   final PipePosition pipePosition;

//   @override
//   Future<void> onLoad() async {
//     final pipe = await Flame.images.load(Assets.pipe);
//     final pipeRotated = await Flame.images.load(Assets.pipeRotated);
//     size = Vector2(80, height);

//     switch (pipePosition) {
//       case PipePosition.top:
//         position.y = 0;
//         sprite = Sprite(pipeRotated);
//         break;
//       case PipePosition.bottom:
//         position.y = gameRef.size.y - size.y - Config.groundHeight;
//         sprite = Sprite(pipe);
//         break;
//     }

//     add(RectangleHitbox());
//   }
// }
