import '../../../../generators/base/list_item_generator.dart';

/// A class that generates tundra resources
class TundraResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    'pelts',
    'meat',
    'antlers',
    'hides',
    'walrus ivory',
    'wool',
    'reindeer hides',
    'furs',
    'arctic berries',
    'arctic cotton',
    'bark',
    'spruce gum',
    'ice crystals',
    'rare flowers',
    'frost diamonds',
    'roots',
    'silver',
    'mushrooms',
  ];

  TundraResourceGenerator() : super(_resources);
}
