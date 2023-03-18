import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'personality_traits_data.dart';

/// A class that generates personality traits
class PersonalityTraitsGenerator implements IGenerator<List<String>> {
  late int _seed;
  final Race _race;

  static const _numberOfTraits = 2;

  PersonalityTraitsGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality traits for the given race
  @override
  List<String> generate() {
    List<String> pool = _getTraitsPool(_race);

    final generator = UniqueGenerator(pool, _numberOfTraits);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the pool to generate personality traits from
  static List<String> _getTraitsPool(Race race) {
    List<String> pool = genericPersonalityTraits;
    for (var entry in personalityTraitsMap.entries) {
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
