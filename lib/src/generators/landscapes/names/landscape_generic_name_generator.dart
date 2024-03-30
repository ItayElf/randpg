import '../../../enums/gender.dart';
import '../../../strings_manipulations.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates landscape name from race names
class LandscapeGenericNameGenerator implements Generator<String> {
  late int _seed;

  LandscapeGenericNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final raceGenerator = ListItemGenerator(RaceManager().activeTypes);
    raceGenerator.seed(_seed);
    final race = raceGenerator.generate();

    final genderGenerator = ListItemGenerator(Gender.values);
    genderGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final gender = genderGenerator.generate();

    final raceNameGenerator = race.getNameGenerator(gender);
    raceNameGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final raceName = raceNameGenerator.generate().split(" ").first;

    return titledEach("the $raceName");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
