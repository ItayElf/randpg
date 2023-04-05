import '../../../enums/gender.dart';
import '../../../strings_manipulations.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates town names based on race names
class DominantRaceNameGenerator implements IGenerator<String> {
  late int _seed;
  Race? _dominantRace;

  DominantRaceNameGenerator(this._dominantRace) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final genderGenerator = ListItemGenerator(Gender.values);
    genderGenerator.seed(_seed);
    final gender = genderGenerator.generate();

    if (_dominantRace == null) {
      final raceGenerator = ListItemGenerator(RaceManager.activeRaces);
      raceGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
      _dominantRace = raceGenerator.generate();
    }

    final generator = _dominantRace!.getNameGenerator(gender);
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return titledEach(generator.generate().split(" ").first);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
