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
    int tempSeed = _seed;

    final everybodyKnowsGenerator = _loreType.getEverybodyKnowsGenerator();
    everybodyKnowsGenerator.seed(tempSeed);
    final everybodyKnows = everybodyKnowsGenerator.generate();
    tempSeed *= tempSeed;

    final fewKnowGenerator = _loreType.getFewKnowGenerator();
    fewKnowGenerator.seed(tempSeed);
    final fewKnow = fewKnowGenerator.generate();
    tempSeed *= tempSeed;

    final nobodyKnowsGenerator = _loreType.getNobodyKnowsGenerator();
    nobodyKnowsGenerator.seed(tempSeed);
    final nobodyKnows = nobodyKnowsGenerator.generate();
    tempSeed *= tempSeed;

    final peasantsGenerator = _loreType.getPeasantsBelieveGenerator();
    peasantsGenerator.seed(tempSeed);
    final peasantsBelieve = peasantsGenerator.generate();
    tempSeed *= tempSeed;

    final nobilityGenerator = _loreType.getNobilityBelievesGenerator();
    nobilityGenerator.seed(tempSeed);
    final nobilityBelieves = nobilityGenerator.generate();
    tempSeed *= tempSeed;

    final godsPlanGenerator = _loreType.getGodsPlanGenerator();
    godsPlanGenerator.seed(tempSeed);
    final godsPlan = godsPlanGenerator.generate();
    tempSeed *= tempSeed;

    final godsFearGenerator = _loreType.getGodsFearGenerator();
    godsFearGenerator.seed(tempSeed);
    final godsFear = godsFearGenerator.generate();

    return WorldLore(
      loreType: _loreType,
      everybodyKnows: everybodyKnows,
      fewKnow: fewKnow,
      nobodyKnows: nobodyKnows,
      peasantsBelieve: peasantsBelieve,
      nobilityBelieves: nobilityBelieves,
      godsPlan: godsPlan,
      godsFear: godsFear,
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
