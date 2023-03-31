import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'personality_quirks_data.dart';

/// A class that generates a personality quirk
class BasePersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  BasePersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality quirk
  @override
  String generate() {
    final generator = ListItemGenerator(genericPersonalityQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
