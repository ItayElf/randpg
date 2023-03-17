import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'dwarf_name_data.dart';

/// A class used to generate female dwarf names
class FemaleDwarfNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleDwarfNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(dwarfFemaleNamePrefix),
    ListItemGenerator(dwarfFemaleNameMiddle),
    ListItemGenerator(dwarfFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(dwarfSurnamePrefix),
    ListItemGenerator(dwarfSurnameSuffix),
  ];

  /// Generates a name for a female dwarf
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
