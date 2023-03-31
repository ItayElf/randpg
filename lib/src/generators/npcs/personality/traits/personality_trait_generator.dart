import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'personality_traits_data.dart';

/// A class that generates a personality trait
class BasePersonalityTraitGenerator implements IGenerator<String> {
  late int _seed;

  BasePersonalityTraitGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality a trait
  @override
  String generate() {
    final generator = ListItemGenerator(genericPersonalityTraits);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
