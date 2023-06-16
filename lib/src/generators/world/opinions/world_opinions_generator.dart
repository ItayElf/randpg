import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';

class WorldOpinionsGenerator implements IGenerator<Map<Race, String>> {
  late int _seed;

  WorldOpinionsGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  Map<Race, String> generate() {
    final generator = BatchGenerator(
      Map.fromEntries(
        RaceManager().activeTypes.map(
              (race) => MapEntry(race.getName(), race.getOpinionGenerator()),
            ),
      ),
    );
    generator.seed(_seed);
    final results = generator.generate();

    return results.map(
      (key, value) => MapEntry(
        RaceManager().getType(key),
        value,
      ),
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
