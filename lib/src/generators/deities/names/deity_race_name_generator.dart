import '../../../enums/gender.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates deity names based on a race
class DeityRaceNameGenerator implements IGenerator<String> {
  late int _seed;
  Gender? _gender;
  Race? _worshipedBy;

  DeityRaceNameGenerator(this._gender, this._worshipedBy) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    if (_worshipedBy == null) {
      final raceGenerator = ListItemGenerator(RaceManager().activeTypes);
      raceGenerator.seed(_seed);
      _worshipedBy = raceGenerator.generate();
    }

    if (_gender == null) {
      final genderGenerator = ListItemGenerator(Gender.values);
      genderGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
      _gender = genderGenerator.generate();
    }

    final generator = _worshipedBy!.getNameGenerator(_gender!);
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return generator.generate().split(" ").first;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
