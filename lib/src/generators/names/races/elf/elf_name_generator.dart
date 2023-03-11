import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_elf_name_generator.dart';
import 'male_elf_name_generator.dart';

/// A generator for elf names
class ElfNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  ElfNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates an elf name based on its gender
  @override
  String generate() {
    var generator = _isMale ? MaleElfNameGenerator() : FemaleElfNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
