import '../../../../generators/base/list_item_generator.dart';

/// A class that generates species of birds
class BirdSpecieGenerator extends ListItemGenerator<String> {
  static const _species = [
    'parrot',
    'eagle',
    'hawk',
    'owl',
    'raven',
    'crow',
    'dove',
    'canary',
    'finch',
    'pigeon',
    'macaw',
    'falcon',
    'osprey',
    'vulture',
    'condor',
    'seagull',
    'albatross',
    'swan',
    'goose',
    'duck',
    'pelican',
    'stork',
    'crane',
    'woodpecker',
    'kingfisher',
    'hummingbird',
    'swift',
    'swallow',
    'cardinal',
  ];

  BirdSpecieGenerator() : super(_species);
}
