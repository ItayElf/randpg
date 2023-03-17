import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/multiple_generator.dart';
import '../../../base/seed_generator.dart';
import 'elf/elf_skin_generator.dart';
import 'generic/generic_skin_generator.dart';
import 'gnome/gnome_skin_generator.dart';
import 'orc/orc_skin_generator.dart';
import 'scales/scales_skin_generator.dart';
import 'tiefling/tiefling_skin_generator.dart';

/// A class that generates a skin color based on the race
class SkinGenerator implements IGenerator<String> {
  late int _seed;
  final Race _race;

  SkinGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a skin color
  @override
  String generate() {
    final generator = _getGenerator(_race);
    generator.seed(_seed);
    return generator.generate();
  }

  /// Returns the corresponding generator based on the race
  static IGenerator<String> _getGenerator(Race race) {
    switch (race) {
      case Race.dragonborn:
        return ScalesSkinGenerator();
      case Race.elf:
        return ElfSkinGenerator();
      case Race.gnome:
        return GnomeSkinGenerator();
      case Race.halfElf:
        return MultipleGenerator([
          ElfSkinGenerator(),
          GenericSkinGenerator(),
        ]);
      case Race.orc:
        return OrcSkinGenerator();
      case Race.tiefling:
        return TieflingSkinGenerator();
      default:
        return GenericSkinGenerator();
    }
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
