import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';

/// A generator for eye color
class BaseEyesGenerator implements Generator<String> {
  late int _seed;

  BaseEyesGenerator() {
    _seed = SeedGenerator.generate();
  }

  static const _eyeColors = {
    'brown': 4,
    'blue': 2,
    'green': 2,
    'golden': 1,
    'cyan': 1,
    'gray': 1,
    'black': 3,
    'red': 1
  };

  /// Generates eye color
  @override
  String generate() {
    final generator = WeightedGenerator(_eyeColors);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
