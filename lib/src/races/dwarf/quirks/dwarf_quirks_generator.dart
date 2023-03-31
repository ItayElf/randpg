import '../../../generators/base/list_item_generator.dart';

/// A class that generates a dwarf personality quirk
class DwarfPersonalityQuirkGenerator extends ListItemGenerator<String> {
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

  DwarfPersonalityQuirkGenerator() : super(_dwarfQuirks);
}
