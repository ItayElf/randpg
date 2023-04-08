import '../../../../generators/base/list_item_generator.dart';

/// A class that generates river encounters
class RiverEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    'river dragons',
    'giant otters',
    'water nymphs',
    'water elementals',
    'trolls',
    'giant eels',
    'crocodiles',
    'water snakes',
    'water spiders',
    'mermaids',
    'water pixies',
    'ogres',
    'water buffalos',
    'river serpents',
    'water fairies',
    'giant dragonflies',
    'giant clam',
    "giant fish",
    'piranhas',
    'giant turtles',
    'crocodiles',
    'alligators',
    'leeches',
  ];

  RiverEncounterGenerator() : super(_encounters);
}
