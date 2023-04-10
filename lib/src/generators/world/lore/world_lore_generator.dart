import '../../../entities/worlds/world_lore.dart';
import '../../../subtypes/worlds/lore/world_lore_type.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';

/// A class that generates world lores
class WorldLoreGenerator implements IGenerator<WorldLore> {
  late int _seed;
  final WorldLoreType _loreType;

  WorldLoreGenerator(this._loreType) {
    _seed = SeedGenerator.generate();
  }

  @override
  WorldLore generate() {
    Map<String, dynamic> results = {
      "loreType": _loreType.getLoreType(),
    };

    final everybodyKnowsGenerator = _loreType.getEverybodyKnowsGenerator();
    results["everybodyKnows"] =
        _getUniqueResult(everybodyKnowsGenerator, results, _seed);

    final fewKnowGenerator = _loreType.getFewKnowGenerator();
    results["fewKnow"] = _getUniqueResult(fewKnowGenerator, results, _seed);

    final nobodyKnowsGenerator = _loreType.getNobodyKnowsGenerator();
    results["nobodyKnows"] =
        _getUniqueResult(nobodyKnowsGenerator, results, _seed);

    final peasantsGenerator = _loreType.getPeasantsBelieveGenerator();
    results["peasantsBelieve"] =
        _getUniqueResult(peasantsGenerator, results, _seed);

    final nobilityGenerator = _loreType.getNobilityBelievesGenerator();
    results["nobilityBelieves"] =
        _getUniqueResult(nobilityGenerator, results, _seed);

    final godsPlanGenerator = _loreType.getGodsPlanGenerator();
    results["godsPlan"] = _getUniqueResult(godsPlanGenerator, results, _seed);

    final godsFearGenerator = _loreType.getGodsFearGenerator();
    results["godsFear"] = _getUniqueResult(godsFearGenerator, results, _seed);

    return WorldLore.fromMap(results);
  }

  String _getUniqueResult(
    IGenerator<String> generator,
    Map<String, dynamic> map,
    int seed,
  ) {
    String result;
    do {
      generator.seed(seed % SeedGenerator.maxSeed);
      seed = (seed * seed) + 1;
      result = generator.generate();
    } while (map.values.contains(result));

    return result;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
