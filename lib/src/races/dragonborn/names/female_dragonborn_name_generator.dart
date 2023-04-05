import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../generators/base/weighted_generator.dart';
import 'dragonborn_name_data.dart';

/// A class used to generate female dragonborn names
class FemaleDragonbornNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleDragonbornNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(dragonbornFemaleNamePrefix),
    ListItemGenerator(dragonbornFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(dragonbornSurnamePrefix),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameMiddle),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameSuffix)
  ];

  /// Generates a name for a female dragonborn
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
