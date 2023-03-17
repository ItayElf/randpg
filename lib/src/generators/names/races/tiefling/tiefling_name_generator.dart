import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_tiefling_name_generator.dart';
import 'male_tiefling_name_generator.dart';

/// A generator for tiefling names
class TieflingNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  TieflingNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a tiefling based on its gender
  @override
  String generate() {
    var generator =
        _isMale ? MaleTieflingNameGenerator() : FemaleTieflingNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
