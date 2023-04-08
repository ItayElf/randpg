import '../../../../generators/base/list_item_generator.dart';

/// A class that generates ocean resources
class OceanResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "fish",
    "shells",
    "sand",
    "seaweed",
    "pearls",
    "clams",
    "corals",
    "sea salt",
    "algae",
    "seagrass",
    "sponges",
  ];

  OceanResourceGenerator() : super(_resources);
}
