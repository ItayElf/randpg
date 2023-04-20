import '../../../../entities/npcs/hair.dart';
import '../../../../enums/gender.dart';
import '../../../../exceptions/not_found_exceptions.dart';
import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';
import 'generic_hair_data.dart';

/// A class that generates generic hair style based on gender
class BaseHairGenerator implements IGenerator<Hair> {
  late int _seed;
  final Gender _gender;

  BaseHairGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates generic hair style
  @override
  Hair generate() {
    final generator = BatchGenerator({
      "length": _getHairLengthGenerator(_gender),
      "type": ListItemGenerator(genericHairType),
      "color": WeightedGenerator(genericHairColor),
    });

    generator.seed(_seed);
    final generatedHairStyle = generator.generate();

    if (generatedHairStyle["length"] == "bald") {
      return Hair(length: "bald", type: "", color: "");
    }
    return Hair.fromMap(generatedHairStyle);
  }

  /// Returns a hair length generator based on the gender
  static IGenerator<String> _getHairLengthGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return WeightedGenerator(genericMaleHairLength);
      case Gender.female:
        return WeightedGenerator(genericFemaleHairLength);
    }
    // ignore: dead_code
    throw GenderNotSupportedException("Gender ${gender.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
