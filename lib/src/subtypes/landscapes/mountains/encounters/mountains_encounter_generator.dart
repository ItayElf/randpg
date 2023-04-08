import '../../../../generators/base/list_item_generator.dart';

/// A class that generates mountain encounters
class MountainEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    'cloud giants',
    'frost giants',
    'griffins',
    'manticores',
    'stone giants',
    'trolls',
    'red dragons',
    'silver dragons',
    'ogres',
    'cyclopes',
    'dwarf trailblazers',
    'fire giants',
    'harpies',
    'hell hounds',
    'orcs',
    'scouts',
    'tribal warriors',
    'basilisks',
    'chimeras',
    'giant eagles',
    'giant elks',
    'giant goats',
    'lions',
    'air elementals',
    'goats',
    'hippogriffs',
    'saber-toothed tigers',
  ];

  MountainEncounterGenerator() : super(_encounters);
}
