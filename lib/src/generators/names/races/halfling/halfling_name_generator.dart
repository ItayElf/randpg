import '../../../../enums/gender.dart';
import '../../../../randpg_exceptions.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_halfling_name_generator.dart';
import 'male_halfling_name_generator.dart';

/// A generator for halfling names
class HalflingNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;

  HalflingNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a halfling based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  IGenerator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleHalflingNameGenerator();
      case Gender.female:
        return FemaleHalflingNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
