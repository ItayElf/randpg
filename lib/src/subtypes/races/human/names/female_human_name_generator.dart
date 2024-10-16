import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'human_name_data.dart';

/// A class used to generate female human names
class FemaleHumanNameGenerator implements Generator<String> {
  late int _seed;

  FemaleHumanNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<Generator<String>> _classicSurnameTemplate = [
    ListItemGenerator(humanFemaleNamePrefix),
    ListItemGenerator(humanFemaleVowel),
    ListItemGenerator(humanFemaleNameMiddle),
    ListItemGenerator(humanFemaleVowel),
    WeightedGenerator(humanFemaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(humanSurnamePrefix),
    ListItemGenerator(humanSurnameSuffix)
  ];

  static final List<Generator<String>> _uniqueSurnameTemplate = [
    ListItemGenerator(humanFemaleNamePrefix),
    ListItemGenerator(humanFemaleVowel),
    ListItemGenerator(humanFemaleNameMiddle),
    ListItemGenerator(humanFemaleVowel),
    WeightedGenerator(humanFemaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(humanMaleNamePrefix),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameMiddle),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameSuffix),
  ];

  static final List<Generator<String>> _preMadeFirstNameClassicTemplate = [
    ListItemGenerator(humanFemaleFirstNames),
    ConstantGenerator(" "),
    ListItemGenerator(humanSurnamePrefix),
    ListItemGenerator(humanSurnameSuffix)
  ];

  static final List<Generator<String>> _preMadeFirstNameUniqueTemplate = [
    ListItemGenerator(humanFemaleFirstNames),
    ConstantGenerator(" "),
    ListItemGenerator(humanMaleNamePrefix),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameMiddle),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameSuffix),
  ];

  /// Generates a name for a female human
  @override
  String generate() {
    final templateGenerator = ListItemGenerator([
      _classicSurnameTemplate,
      _uniqueSurnameTemplate,
      _preMadeFirstNameClassicTemplate,
      _preMadeFirstNameUniqueTemplate,
    ]);
    templateGenerator.seed(_seed);
    final template = templateGenerator.generate();

    List<Generator<String>> generators = List.from(template);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return titledEach(
        generators.map((generator) => generator.generate()).toList().join());
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
