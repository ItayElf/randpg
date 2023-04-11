import '../../../entities/npcs/npc.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../npcs/npc_generator.dart';

/// A class that generates important people for worlds
class WorldImportantPeopleGenerator implements IGenerator<Npc> {
  late int _seed;
  final WorldSettings _worldSettings;

  WorldImportantPeopleGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  Npc generate() {
    final race = _generateRace(_seed);

    final generator = FutureGenerator(
      BatchGenerator({
        "occupation": _worldSettings.getImportantOccupationGenerator(),
        "npc": NpcGenerator(race),
      }),
      (results) => (results["npc"] as Npc).copyWith(
        occupation: results["occupation"],
      ),
    );
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  Race _generateRace(int seed) {
    final raceGenerator = ListItemGenerator(RaceManager.activeRaces);
    raceGenerator.seed(seed);
    return raceGenerator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
