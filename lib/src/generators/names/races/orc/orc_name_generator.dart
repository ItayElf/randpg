import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_orc_name_generator.dart';
import 'male_orc_name_generator.dart';

/// A generator for orc names
class OrcNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  OrcNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for an orc based on its gender
  @override
  String generate() {
    var generator = _isMale ? MaleOrcNameGenerator() : FemaleOrcNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
