import 'dart:math';

/// A class that generates seeds for entities
class SeedGenerator {
  /// The maximum seed available, due to javascript's `Number.MAX_SAFE_INT`
  static const maxSeed = 9007199254740991;

  /// Generates a random seed
  static int generate() => Random().nextInt(maxSeed);
}
