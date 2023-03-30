import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../generators/base/weighted_generator.dart';
import 'human_name_data.dart';

/// A class used to generate male human names
class MaleHumanNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleHumanNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(humanMaleNamePrefix),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameMiddle),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(humanSurnamePrefix),
    ListItemGenerator(humanSurnameSuffix)
  ];

  /// Generates a name of a male human
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
