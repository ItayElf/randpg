import '../../../../generators/base/list_item_generator.dart';

/// A class that generates desert encounters
class DesertEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    'cyclopes',
    'druids',
    'gnolls',
    'giant hyenas',
    'sphinxes',
    'hobgoblins',
    'medusas',
    'scouts',
    'blue dragons',
    'brass dragons',
    'dracoliches',
    'ogres',
    'bandits',
    'fire elementals',
    'half-ogres',
    'hobgoblins',
    'tribal warriors',
    'giant snakes',
    'giant scorpions',
    'lions',
    'mummies',
    'air elementals',
    'constrictor snakes',
    'flying snakes',
    'giant lizards',
    'giant scorpions',
    'giant spiders',
    'giant vultures',
    'hyenas',
    'jackals',
    'scorpions',
    'skeletons',
    'vultures',
    'camels',
  ];

  DesertEncounterGenerator() : super(_encounters);
}
