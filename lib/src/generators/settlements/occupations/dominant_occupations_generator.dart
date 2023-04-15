import '../../base/list_item_generator.dart';

/// A class that generates an occupation that is the dominant in the settlement
class DominantOccupationsGenerator extends ListItemGenerator<String> {
  static const _dominantOccupations = [
    'artisans',
    'bandits',
    'criminals',
    'farmers',
    'fishers',
    'hunters',
    'merchants',
    'miners',
    'sailors',
    'shepherds',
    'slavers',
    'soldiers',
    'traders',
  ];

  DominantOccupationsGenerator() : super(_dominantOccupations);
}
