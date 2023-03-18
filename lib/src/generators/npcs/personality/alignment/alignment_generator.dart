import '../../../../entities/npcs/alignment.dart';
import '../../../../enums/alignment.dart';
import '../../../../enums/race.dart';
import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';
import 'alignment_data.dart';

/// A class that generates an alignment based on [_race]
class AlignmentGenerator implements IGenerator<Alignment> {
  late int _seed;
  final Race _race;

  AlignmentGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  @override
  Alignment generate() {
    final ethicalPool = _getEthicalPool(_race);
    final moralMap = _getMoralPool(_race);

    final generator = BatchGenerator({
      "ethical": WeightedGenerator(ethicalPool),
      "moral": WeightedGenerator(moralMap),
    });
    generator.seed(_seed);
    final generatedAlignment = generator.generate();

    return Alignment.fromMap(
      Map.fromEntries(
        generatedAlignment.entries.map(
          (entry) => MapEntry(entry.key, entry.value.name),
        ),
      ),
    );
  }

  /// Returns the ethical pool of [race]
  static Map<EthicalAlignment, int> _getEthicalPool(Race race) {
    Map<EthicalAlignment, int> ethicalPool = Map.from(genericEthicalMap);
    for (var entry in ethicalMap.entries) {
      if (entry.key.contains(race)) {
        ethicalPool = Map.from(entry.value);
      }
    }
    return ethicalPool;
  }

  /// Returns the moral pool of [race]
  static Map<MoralAlignment, int> _getMoralPool(Race race) {
    Map<MoralAlignment, int> moralPool = Map.from(genericMoralMap);
    for (var entry in moralMap.entries) {
      if (entry.key.contains(race)) {
        moralPool = Map.from(entry.value);
      }
    }
    return moralPool;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
