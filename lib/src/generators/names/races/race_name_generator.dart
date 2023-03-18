import '../../../enums/gender.dart';
import '../../../enums/race.dart';
import '../../../randpg_exceptions.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import './dragonborn/dragonborn_name_generator.dart';
import 'dwarf/dwarf_name_generator.dart';
import 'elf/elf_name_generator.dart';
import 'gnome/gnome_name_generator.dart';
import 'half_elf/half_elf_name_generator.dart';
import 'halfling/halfling_name_generator.dart';
import 'human/human_name_generator.dart';
import 'orc/orc_name_generator.dart';
import 'tiefling/tiefling_name_generator.dart';

/// A class that generates names based on gender and race
class RaceNameGenerator implements IGenerator<String> {
  late int _seed;
  final Gender _gender;
  final Race _race;

  RaceNameGenerator(this._gender, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for based on a gender and a race
  @override
  String generate() {
    var generator = _getGenerator(_gender, _race);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the correct name generator for the given gender and race
  static IGenerator<String> _getGenerator(Gender gender, Race race) {
    switch (race) {
      case Race.dragonborn:
        return DragonbornNameGenerator(gender);
      case Race.dwarf:
        return DwarfNameGenerator(gender);
      case Race.elf:
        return ElfNameGenerator(gender);
      case Race.gnome:
        return GnomeNameGenerator(gender);
      case Race.halfElf:
        return HalfElfNameGenerator(gender);
      case Race.halfling:
        return HalflingNameGenerator(gender);
      case Race.human:
        return HumanNameGenerator(gender);
      case Race.orc:
        return OrcNameGenerator(gender);
      case Race.tiefling:
        return TieflingNameGenerator(gender);
    }
    // ignore: dead_code
    throw RaceNotSupportedException("Race ${race.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
