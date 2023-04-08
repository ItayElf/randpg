import '../../../../generators/base/list_item_generator.dart';

/// A class that generates ocean encounters
class OceanEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    'sea hags',
    'storm giants',
    'bronze dragons',
    'harpies',
    'dragon turtles',
    'giant octopi',
    'giant sharks',
    'hunter sharks',
    'hydras',
    'blood hawks',
    'dolphins',
    'giant crabs',
    'giant sea horses',
    'killer whales',
    'reef sharks',
    'water elementals',
    'sirens',
    'krakens',
    'sea serpents',
    'leviathans',
    'sea dragons',
    'sea ghosts',
    'leeches',
    'sea sprites',
    "giant squids",
    "sea turtles",
    "stingrays",
    "giant stingrays",
    "electric eels",
    "giant eels",
    "giant jellyfishes",
    "giant sea slugs",
    "sea lions",
    "whales",
    "narwhales",
    "giant sea urchins",
    "mermaids",
  ];

  OceanEncounterGenerator() : super(_encounters);
}
