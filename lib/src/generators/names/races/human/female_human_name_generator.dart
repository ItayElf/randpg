import '../../../base/generator.dart';
import '../../../base/list_item_genrator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';
import 'human_name_data.dart';

/// A class used to generate female human names
class FemaleHumanNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleHumanNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(humanFemaleNamePrefix),
    ListItemGenerator(humanFemaleVowel),
    ListItemGenerator(humanFemaleNameMiddle),
    ListItemGenerator(humanFemaleVowel),
    WeightedGenerator(humanFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(humanSurnamePrefix),
    ListItemGenerator(humanSurnameSuffix)
  ];

  @override
  String generate() {
    List<IGenerator<String>> generators = List.from(_generatorsTemplate);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return generators.map((generator) => generator.generate()).toList().join();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
