import 'package:radnpg/src/generators/names/races/human/female_human_name_generator.dart';
import 'package:radnpg/src/generators/names/races/human/male_human_name_generator.dart';

import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';

class HumanNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool isMale;

  HumanNameGenerator(this.isMale) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    var generator =
        isMale ? MaleHumanNameGenerator() : FemaleHumanNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
