import '../../../../generators/base/list_item_generator.dart';

/// A class that generates river resources
class RiverResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "fish",
    "shells",
    "gravel",
    "sand",
    "gold",
    "coal",
    "timber",
    "medical plants",
    "reed",
    "clay",
    "seaweed",
    "pearls",
    "clams",
  ];

  RiverResourceGenerator() : super(_resources);
}
