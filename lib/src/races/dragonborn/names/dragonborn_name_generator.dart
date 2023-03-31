import '../../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../randpg_exceptions.dart';
import 'female_dragonborn_name_generator.dart';
import 'male_dragonborn_name_generator.dart';

/// A generator for dragonborn names
class DragonbornNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;

  DragonbornNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a dragonborn name based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the correct generator based on the gender
  IGenerator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleDragonbornNameGenerator();
      case Gender.female:
        return FemaleDragonbornNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
