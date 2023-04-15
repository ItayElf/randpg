import '../../base/list_item_generator.dart';

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
