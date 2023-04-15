import '../../../entities/kingdoms/kingdom.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/repeated_generator.dart';
import '../../base/seed_generator.dart';
import '../../kingdoms/kingdom_generator.dart';

/// A class that generates settlements for worlds
class WorldKingdomsGenerator implements IGenerator<List<Kingdom>> {
  late int _seed;
  final WorldSettings _worldSettings;

  WorldKingdomsGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Kingdom> generate() {
    final kingdomsCountGenerator = _worldSettings.getKingdomsCountGenerator();
    kingdomsCountGenerator.seed(_seed);
    final kingdomsCount = kingdomsCountGenerator.generate();

    final racesGenerator = RepeatedGenerator(
        ListItemGenerator(RaceManager.activeRaces), kingdomsCount);
    racesGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final races = racesGenerator.generate();

    final generator = ListBatchGenerator(
      races
          .map(
              (race) => KingdomGenerator(_worldSettings.getKingdomType(), race))
          .toList(),
    );
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
