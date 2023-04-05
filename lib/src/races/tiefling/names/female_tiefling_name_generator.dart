import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import 'tiefling_name_data.dart';

/// A class used to generate female tiefling names
class FemaleTieflingNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleTieflingNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(tieflingFemaleNamePrefix),
    ListItemGenerator(tieflingFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(tieflingMaleNamePrefix),
    ListItemGenerator(tieflingMaleNameSuffix)
  ];

  /// Generates a name of a female tiefling
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
