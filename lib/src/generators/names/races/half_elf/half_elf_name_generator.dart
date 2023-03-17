import '../../../../enums/gender.dart';
import '../../../../randpg_exceptions.dart';
import '../../../base/generator.dart';
import '../../../base/multiple_generator.dart';
import '../../../base/seed_generator.dart';
import '../elf/female_elf_name_generator.dart';
import '../elf/male_elf_name_generator.dart';
import '../human/female_human_name_generator.dart';
import '../human/male_human_name_generator.dart';

/// A generator for half-elf names
class HalfElfNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;

  HalfElfNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for an half-elf based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  IGenerator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MultipleGenerator([
          MaleHumanNameGenerator(),
          MaleElfNameGenerator(),
        ]);
      case Gender.female:
        return MultipleGenerator([
          FemaleHumanNameGenerator(),
          FemaleElfNameGenerator(),
        ]);
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
