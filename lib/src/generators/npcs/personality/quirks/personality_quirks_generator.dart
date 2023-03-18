import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'personality_quirks_data.dart';

/// A class that generates personality quirks
class PersonalityQuirksGenerator implements IGenerator<List<String>> {
  late int _seed;
  final Race _race;

  static const _numberOfQuirks = 2;

  PersonalityQuirksGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality quirks for the given race
  @override
  List<String> generate() {
    List<String> pool = _getQuirksPool(_race);

    final generator = UniqueGenerator(pool, _numberOfQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the pool to generate personality quirks from
  static List<String> _getQuirksPool(Race race) {
    List<String> pool = genericPersonalityQuirks;
    for (var entry in personalityQuirksMap.entries) {
      if (entry.key.contains(race)) {
        pool += entry.value;
      }
    }
    return pool;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
