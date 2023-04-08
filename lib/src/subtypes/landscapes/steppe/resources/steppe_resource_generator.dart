import '../../../../generators/base/list_item_generator.dart';

/// A class that generates steppe resources
class SteppeResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "horses",
    "wild grains",
    "amber",
    "clay",
    "ancient pottery",
    "wild berries",
    "furs",
    "beeswax",
    "wild honey",
    "wild spices",
    "fish",
    "silk",
    "skins",
    "hides",
    "cotton",
    "wild tea leaves",
  ];

  SteppeResourceGenerator() : super(_resources);
}
