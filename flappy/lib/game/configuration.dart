// configuration.dart
class Config {
  static const groundHeight = 10.0;
  static double gameSpeed = 200.0; // Changed from const to static double
  static const pipeInterval = 1.5;
  static const birdVelocity = 210;
  static const gravity = -100.0;
  static const cloudsHeight = 70.0;

  // Add a method to increase speed
  static void increaseSpeed() {
    gameSpeed += 100.0; // Increase by 20 units - you can adjust this value
  }
}
