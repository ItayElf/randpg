import '../../../../generators/base/list_item_generator.dart';

/// A class that generates forest resources
class ForestResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "woods",
    "herbs",
    "fruits",
    "furs",
    "meat",
    "wild berries",
    "mushrooms",
    "honey",
    "hides",
    "resin",
    "water",
    "enchanted wood",
    "magic mushrooms",
    "magical eggs",
    "ancient herbs",
    "rare flowers",
    "crystals",
    "gemstones",
    "roots",
    "organs of a rare creature"
  ];

  ForestResourceGenerator() : super(_resources);
}
