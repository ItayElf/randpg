import '../../../../../entities/npcs/hair.dart';
import '../../../../../enums/gender.dart';
import '../../../../../randpg_exceptions.dart';
import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';
import '../../../../base/weighted_generator.dart';
import '../generic/generic_hair_data.dart';

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
    final generators = [
      _getHairLengthGenerator(_gender),
      ListItemGenerator(genericHairType),
      ListItemGenerator(_tieflingHairColors),
    ];

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }

    final generatedHairStyle =
        generators.map((generator) => generator.generate()).toList();

    if (generatedHairStyle.first == "bald") {
      return Hair(length: "bald", type: "", color: "");
    }
    return Hair(
      length: generatedHairStyle[0],
      type: generatedHairStyle[1],
      color: generatedHairStyle[2],
    );
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
