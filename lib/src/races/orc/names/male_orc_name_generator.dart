import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../generators/base/weighted_generator.dart';
import 'orc_name_data.dart';

/// A class used to generate male orc names
class MaleOrcNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleOrcNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(orcMaleNamePrefix),
    WeightedGenerator(orcMaleNameVowel),
    ListItemGenerator(orcMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(orcFemaleNamePrefix),
    WeightedGenerator(orcFemaleNameVowel),
    ListItemGenerator(orcFemaleNameSuffix)
  ];

  /// Generates a name of a male orc
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
