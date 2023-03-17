import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'female_gnome_name_generator.dart';
import 'male_gnome_name_generator.dart';

/// A generator for gnome names
class GnomeNameGenerator implements IGenerator<String> {
  late int _seed;
  final bool _isMale;

  GnomeNameGenerator(this._isMale) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a gnome based on its gender
  @override
  String generate() {
    var generator =
        _isMale ? MaleGnomeNameGenerator() : FemaleGnomeNameGenerator();
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
