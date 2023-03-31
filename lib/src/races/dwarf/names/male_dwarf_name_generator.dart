import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import 'dwarf_name_data.dart';

/// A class used to generate male dwarf names
class MaleDwarfNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleDwarfNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(dwarfMaleNamePrefix),
    ListItemGenerator(dwarfMaleNameMiddle),
    ListItemGenerator(dwarfMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(dwarfSurnamePrefix),
    ListItemGenerator(dwarfSurnameSuffix),
  ];

  /// Generates a name for a male dwarf
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
