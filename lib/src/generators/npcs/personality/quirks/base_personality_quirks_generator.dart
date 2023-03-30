import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'personality_quirks_data.dart';

/// A class that generates personality quirks
class BasePersonalityQuirksGenerator implements IGenerator<List<String>> {
  late int _seed;

  static const _numberOfQuirks = 2;

  BasePersonalityQuirksGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality quirks for the given race
  @override
  List<String> generate() {
    final generator =
        UniqueGenerator(genericPersonalityQuirks, _numberOfQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
