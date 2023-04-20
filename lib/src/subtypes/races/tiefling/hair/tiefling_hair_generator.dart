import '../../../../entities/npcs/hair.dart';
import '../../../../enums/gender.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../generators/npcs/physical/hair/generic_hair_data.dart';
import '../../../../exceptions/not_found_exceptions.dart';

/// A class that generates tiefling hair style based on gender
class TieflingHairGenerator implements IGenerator<Hair> {
  late int _seed;
  final Gender _gender;

  static const _tieflingHairColors = [
    "red",
    "brown",
    "black",
    "dark blue",
    "purple"
  ];

  TieflingHairGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates tiefling hair style
  @override
  Hair generate() {
    final generator = BatchGenerator({
      "length": _getHairLengthGenerator(_gender),
      "type": ListItemGenerator(genericHairType),
      "color": ListItemGenerator(_tieflingHairColors),
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
