import 'dart:math';

/// A class that generates seeds for entities
class SeedGenerator {
  /// The maximum seed available
  static const maxSeed = 4294967296;

  /// Generates a random seed
  static int generate() => Random().nextInt(maxSeed);
}
