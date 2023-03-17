import 'dart:math';

import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates random number inside a range, not including the maximum
class NumberGenerator implements IGenerator<int> {
  late int _seed;
  final int _minimum;
  final int _maximum;

  NumberGenerator(this._minimum, this._maximum) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a random number between minimum and maximum inclusively
  @override
  int generate() {
    final random = Random(_seed);
    return random.nextInt(_maximum - _minimum) + _minimum;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
