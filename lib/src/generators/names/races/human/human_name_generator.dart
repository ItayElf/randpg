import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_human_name_generator.dart';
import 'male_human_name_generator.dart';

class HumanNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  HumanNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a human based on its gender
  @override
  String generate() {
    var generator =
        _isMale ? MaleHumanNameGenerator() : FemaleHumanNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
