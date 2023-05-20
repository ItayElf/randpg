import 'package:randpg/entities/kingdoms.dart';

import '../../../subtypes/races/race_manager.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/repeated_generator.dart';
import '../../base/seed_generator.dart';

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

    final governmentTypeGenerator =
        ListItemGenerator(GovernmentTypeManager.activeGovernmentTypes);
    governmentTypeGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    GovernmentType governmentType;

    final List<Kingdom> results = [];

    for (int i = 0; i < kingdomsCount; i++) {
      governmentType = governmentTypeGenerator.generate();
      final generator = KingdomGenerator(
          _worldSettings.getKingdomType(), races[i], governmentType);

      generator.seed(_seed + i * i * i);
      governmentTypeGenerator.seed(_seed + i * i * i);

      results.add(generator.generate());
    }
    return results;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
