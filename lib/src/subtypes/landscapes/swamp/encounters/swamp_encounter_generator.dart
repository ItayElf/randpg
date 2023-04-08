import '../../../../generators/base/list_item_generator.dart';

/// A class that generates swamp encounters
class SwampEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    'druids',
    'green hags',
    'lizardfolks',
    'scouts',
    'trolls',
    'black dragons',
    'ogres',
    'orcs',
    'tribal warriors',
    'crocodiles',
    'giant snakes',
    'giant crocodiles',
    'giant spiders',
    'giant toads',
    'hydras',
    "will-o'-wisps",
    'ghouls',
    'giant frogs',
    'giant lizards',
    'giant rats',
    'hydras',
    'water elementals',
  ];

  SwampEncounterGenerator() : super(_encounters);
}
