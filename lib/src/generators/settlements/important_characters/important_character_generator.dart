import '../../../entities/npcs/npc.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/weighted_generator.dart';
import '../../npcs/npc_generator.dart';

/// A class that generates important characters for settlements
class ImportantCharacterGenerator implements IGenerator<Npc> {
  late int _seed;
  final IGenerator<String> _occupationGenerator;
  final Race? _dominantRace;

  static const _dominantRaceWeight = 7;
  static const _otherRaceWeight = 3;

  ImportantCharacterGenerator(this._occupationGenerator, this._dominantRace) {
    _seed = SeedGenerator.generate();
  }

  @override
  Npc generate() {
    final race = _generateRace(_seed);

    final generator = FutureGenerator(
      BatchGenerator({
        "occupation": _occupationGenerator,
        "npc": NpcGenerator(race),
      }),
      (results) => (results["npc"]).copyWith(
        occupation: results["occupation"],
      ),
    );
    generator.seed(_seed);
    return generator.generate();
  }

  Race _generateRace(int seed) {
    final raceGenerator = ListItemGenerator(RaceManager().activeTypes);
    raceGenerator.seed(seed);
    final race = raceGenerator.generate();

    if (_dominantRace == null) {
      return race;
    }

    final generator = WeightedGenerator({
      _dominantRace!: _dominantRaceWeight,
      race: _otherRaceWeight,
    });
    generator.seed(seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
