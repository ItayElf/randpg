import 'dart:math';

import 'package:radnpg/src/generators/base/generator.dart';
import 'package:radnpg/src/generators/base/list_item_genrator.dart';
import 'package:radnpg/src/generators/base/seed_generator.dart';
import 'package:radnpg/src/generators/base/weighted_generator.dart';
import 'package:radnpg/src/generators/names/races/human/human_name_data.dart';

/// A class used to generate male human names
class MaleHumanNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleHumanNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> generatorsTemplate = [
    ListItemGenerator(humanMaleNamePrefix),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameMiddle),
    WeightedGenerator(humanMaleVowel),
    ListItemGenerator(humanMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(humanSurnamePrefix),
    ListItemGenerator(humanSurnameSuffix)
  ];

  @override
  String generate() {
    List<IGenerator<String>> generators = List.from(generatorsTemplate);

    for (var generator in generators) {
      generator.seed(_seed);
    }
    return generators.map((generator) => generator.generate()).toList().join();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
