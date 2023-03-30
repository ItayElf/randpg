import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'personality_traits_data.dart';

/// A class that generates personality traits
class BasePersonalityTraitsGenerator implements IGenerator<List<String>> {
  late int _seed;

  static const _numberOfTraits = 2;

  BasePersonalityTraitsGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality traits for the given race
  @override
  List<String> generate() {
    final generator =
        UniqueGenerator(genericPersonalityTraits, _numberOfTraits);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
