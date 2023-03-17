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
  final Race _race;
  final bool _isMale;

  RaceNameGenerator(this._isMale, this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a name for based on a gender and a race
  @override
  String generate() {
    var generator = _getGenerator(_isMale, _race);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the correct name generator for the given gender and race
  static IGenerator<String> _getGenerator(bool isMale, Race race) {
    switch (race) {
      case Race.dragonborn:
        return DragonbornNameGenerator(isMale);
      case Race.dwarf:
        return DwarfNameGenerator(isMale);
      case Race.elf:
        return ElfNameGenerator(isMale);
      case Race.gnome:
        return GnomeNameGenerator(isMale);
      case Race.halfElf:
        return HalfElfNameGenerator(isMale);
      case Race.halfling:
        return HalflingNameGenerator(isMale);
      case Race.human:
        return HumanNameGenerator(isMale);
      case Race.orc:
        return OrcNameGenerator(isMale);
      case Race.tiefling:
        return TieflingNameGenerator(isMale);
    }
    // ignore: dead_code
    throw RaceNotSupportedException("Race ${race.name} is not supported");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
