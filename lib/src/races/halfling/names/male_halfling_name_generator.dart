import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import 'halfling_name_data.dart';

/// A class used to generate male halfling names
class MaleHalflingNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleHalflingNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(halflingMaleNamePrefix),
    ListItemGenerator(halflingMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(halflingSurnamePrefix),
    ListItemGenerator(halflingSurnameSuffix)
  ];

  /// Generates a name of a male halfling
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