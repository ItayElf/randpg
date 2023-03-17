import '../../../../enums/gender.dart';
import '../../../../randpg_exceptions.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_dwarf_name_generator.dart';
import 'male_dwarf_name_generator.dart';

/// A generator for dwarf names
class DwarfNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;

  DwarfNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a dwarf name based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  IGenerator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleDwarfNameGenerator();
      case Gender.female:
        return FemaleDwarfNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
