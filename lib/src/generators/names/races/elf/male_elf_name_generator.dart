import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'elf_name_data.dart';

/// A class used to generate male elf names
class MaleElfNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleElfNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(elfMaleName),
    ListItemGenerator([" "]),
    ListItemGenerator(elfSurnamePrefix),
    ListItemGenerator(elfSurnameSuffix)
  ];

  /// Generates a name of a male elf
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
