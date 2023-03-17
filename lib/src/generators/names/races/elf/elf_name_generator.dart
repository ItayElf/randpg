import '../../../../enums/gender.dart';
import '../../../../randpg_exceptions.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_elf_name_generator.dart';
import 'male_elf_name_generator.dart';

/// A generator for elf names
class ElfNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;

  ElfNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates an elf name based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  IGenerator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleElfNameGenerator();
      case Gender.female:
        return FemaleElfNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
