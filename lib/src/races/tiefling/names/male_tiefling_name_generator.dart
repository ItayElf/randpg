import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import 'tiefling_name_data.dart';

/// A class used to generate male tiefling names
class MaleTieflingNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleTieflingNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(tieflingMaleNamePrefix),
    ListItemGenerator(tieflingMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(tieflingFemaleNamePrefix),
    ListItemGenerator(tieflingFemaleNameSuffix)
  ];

  /// Generates a name of a male tiefling
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
