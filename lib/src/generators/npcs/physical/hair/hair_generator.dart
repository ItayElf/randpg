import '../../../../entities/npcs/hair.dart';
import '../../../../enums/gender.dart';
import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/multiple_generator.dart';
import '../../../base/seed_generator.dart';
import 'dragonborn/dragonborn_head_generator.dart';
import 'elf/elf_hair_generator.dart';
import 'generic/generic_hair_generator.dart';

/// A class that generates hair based on gender and race
class HairGenerator implements IGenerator<Hair> {
  late int _seed;
  final Gender _gender;
  final Race _race;

  HairGenerator(this._gender, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates hair based on the gender and race
  @override
  Hair generate() {
    final generator = _getGenerator(_gender, _race);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the corresponding generator for the given gender and race
  static IGenerator<Hair> _getGenerator(Gender gender, Race race) {
    switch (race) {
      case Race.dragonborn:
        return DragonbornHeadGenerator();
      case Race.elf:
        return ElfHairGenerator();
      case Race.halfElf:
        return MultipleGenerator([
          ElfHairGenerator(),
          GenericHairGenerator(gender),
        ]);
      default:
        return GenericHairGenerator(gender);
    }
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
