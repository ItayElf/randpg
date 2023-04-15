import '../../../enums/gender.dart';
import '../../../strings_manipulations.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../../subtypes/races/settlement_nameable.dart';
import '../../base/future_generator.dart';
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

    final isDominant = _dominantRace == null;

    if (_dominantRace == null) {
      final raceGenerator = ListItemGenerator(RaceManager.activeRaces);
      raceGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
      _dominantRace = raceGenerator.generate();
    }

    final generator = _getNameGenerator(isDominant, gender);
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return titledEach(generator.generate());
  }

  IGenerator<String> _getNameGenerator(bool isDominant, Gender gender) {
    if (isDominant && _dominantRace is SettlementNameable) {
      return (_dominantRace as SettlementNameable).getSettlementNameGenerator();
    }
    return FutureGenerator(
      _dominantRace!.getNameGenerator(gender),
      (name) => name.split(" ").first,
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
