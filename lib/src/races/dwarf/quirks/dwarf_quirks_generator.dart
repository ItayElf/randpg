import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates a dwarf personality quirk
class DwarfPersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  static const _dwarfQuirks = [
    'always has a good ale at hand',
    'feels ill at ease in open spaces',
    'is more comfortable underground',
    'frequently hums old dwarven songs',
    'misses the world as it used to be',
    'is strongly rooted within tradition',
    'will take on any bet while drinking',
    'is always covered in dirt',
    'has almost never been above ground',
    'doesn\'t feel comfortable when away from an axe',
    'is always seen sharpening an axe',
    'cannot take a halfling seriously',
    'harbours a deep hatred of orcs and goblins',
    'has gem-cutting as a hobby',
    'is secretly captivated by elves'
  ];

  DwarfPersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality quirk
  @override
  String generate() {
    final generator = ListItemGenerator(_dwarfQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
