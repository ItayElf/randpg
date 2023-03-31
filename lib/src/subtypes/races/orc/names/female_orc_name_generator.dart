import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import 'orc_name_data.dart';

/// A class used to generate female orc names
class FemaleOrcNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleOrcNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(orcFemaleNamePrefix),
    WeightedGenerator(orcFemaleNameVowel),
    ListItemGenerator(orcFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(orcMaleNamePrefix),
    WeightedGenerator(orcMaleNameVowel),
    ListItemGenerator(orcMaleNameSuffix)
  ];

  /// Generates a name of a female orc
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
