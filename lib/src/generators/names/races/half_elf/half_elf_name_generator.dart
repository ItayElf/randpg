import '../../../base/generator.dart';
import '../../../base/multiple_generator.dart';
import '../../../base/seed_generator.dart';
import '../elf/female_elf_name_generator.dart';
import '../elf/male_elf_name_generator.dart';
import '../human/female_human_name_generator.dart';
import '../human/male_human_name_generator.dart';

/// A generator for half-elf names
class GnomeNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  GnomeNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for an half-elf based on its gender
  @override
  String generate() {
    IGenerator<String> generator;
    if (_isMale) {
      generator = MultipleGenerator([
        MaleHumanNameGenerator(),
        MaleElfNameGenerator(),
      ]);
    } else {
      generator = MultipleGenerator([
        FemaleHumanNameGenerator(),
        FemaleElfNameGenerator(),
      ]);
    }
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
