import '../../../../../entities/npcs/hair.dart';
import '../../../../../enums/gender.dart';
import '../../../../../randpg_exceptions.dart';
import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';
import '../../../../base/weighted_generator.dart';
import 'generic_hair_data.dart';

/// A class that generates generic hair style based on gender
class GenericHairGenerator implements IGenerator<Hair> {
  late int _seed;
  final Gender _gender;

  GenericHairGenerator(this._gender) {
    _seed = SeedGenerator.generate();
  }

  /// Generates generic hair style
  @override
  Hair generate() {
    final generators = [
      _getHairLengthGenerator(_gender),
      ListItemGenerator(genericHairType),
      WeightedGenerator(genericHairColor),
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
