import '../../../base/generator.dart';
import '../../../base/list_item_genrator.dart';
import '../../../base/seed_generator.dart';
import 'halfling_name_data.dart';

/// A class used to generate female halfling names
class FemaleHalflingNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleHalflingNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(halflingFemaleNamePrefix),
    ListItemGenerator(halflingFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(halflingSurnamePrefix),
    ListItemGenerator(halflingSurnameSuffix)
  ];

  /// Generates a name of a female halfling
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
