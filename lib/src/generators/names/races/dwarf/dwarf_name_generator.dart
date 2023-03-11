import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_dwarf_name_generator.dart';
import 'male_dwarf_name_generator.dart';

/// A generator for dwarf names
class DwarfNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  DwarfNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a dwarf name based on its gender
  @override
  String generate() {
    var generator =
        _isMale ? MaleDwarfNameGenerator() : FemaleDwarfNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
