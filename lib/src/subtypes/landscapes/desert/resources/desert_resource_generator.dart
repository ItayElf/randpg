import '../../../../generators/base/list_item_generator.dart';

/// A class that generates desert resources
class DesertResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    'rare minerals',
    'cactus fruit',
    'scorpion venom',
    'snake venom',
    'sandstone',
    'salt',
    'palm fronds',
    'medicinal plants',
    'camel hair',
    'desert diamonds',
    "sandstone",
    "clay",
    "colored sand",
    "petrified wood",
  ];

  DesertResourceGenerator() : super(_resources);
}
