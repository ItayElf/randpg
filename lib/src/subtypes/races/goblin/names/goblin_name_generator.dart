import '../../../../../enums/gender.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../exceptions/not_found_exceptions.dart';
import 'female_goblin_name_generator.dart';
import 'male_goblin_name_generator.dart';

/// A generator for goblin names
class GoblinNameGenerator implements Generator<String> {
  late int _seed;
  final Gender _gender;

  GoblinNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a goblin based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  Generator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleGoblinNameGenerator();
      case Gender.female:
        return FemaleGoblinNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
