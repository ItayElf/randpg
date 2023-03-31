import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import 'dragonborn_name_data.dart';

/// A class used to generate male dragonborn names
class MaleDragonbornNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleDragonbornNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(dragonbornMaleNamePrefix),
    ListItemGenerator(dragonbornMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(dragonbornSurnamePrefix),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameMiddle),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameSuffix)
  ];

  /// Generates a name for a male dragonborn
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
