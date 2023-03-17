import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_halfling_name_generator.dart';
import 'male_halfling_name_generator.dart';

/// A generator for halfling names
class HalflingNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  HalflingNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a halfling based on its gender
  @override
  String generate() {
    var generator =
        _isMale ? MaleHalflingNameGenerator() : FemaleHalflingNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
