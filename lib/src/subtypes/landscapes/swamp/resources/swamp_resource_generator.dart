import '../../../../generators/base/list_item_generator.dart';

/// A class that generates swamp resources
class SwampResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "herbs",
    "gems",
    "rare mushrooms",
    "magic mushrooms",
    "rare flowers",
    "crystals",
    "gemstones",
    "roots",
    "mud",
    "woods",
    "dyes",
    "clay",
    "iron",
  ];

  SwampResourceGenerator() : super(_resources);
}
