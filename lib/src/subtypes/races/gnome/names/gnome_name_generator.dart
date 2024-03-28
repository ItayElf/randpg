import '../../../../../enums/gender.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../exceptions/not_found_exceptions.dart';
import 'female_gnome_name_generator.dart';
import 'male_gnome_name_generator.dart';

/// A generator for gnome names
class GnomeNameGenerator implements Generator<String> {
  late int _seed;
  final Gender _gender;

  GnomeNameGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for a gnome based on its gender
  @override
  String generate() {
    var generator = _getGenerator(_gender);
    generator.seed(_seed);
    return generator.generate();
  }

  Generator<String> _getGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleGnomeNameGenerator();
      case Gender.female:
        return FemaleGnomeNameGenerator();
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
