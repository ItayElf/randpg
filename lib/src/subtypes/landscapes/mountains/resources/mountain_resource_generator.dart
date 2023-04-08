import '../../../../generators/base/list_item_generator.dart';

/// A class that generates mountain resources
class MountainResourceGenerator extends ListItemGenerator<String> {
  static const _resources = [
    "obsidian",
    "gold",
    "copper",
    "gems",
    "diamonds",
    "rare minerals",
    "crystals",
    "exotic spices that grow only in high altitudes",
    "exotic herbs that grow only in high altitudes",
    "exotic plants that grow only in high altitudes",
    "mushrooms",
    "crystallized magma",
    "salt",
    "natural stone",
    "jade",
    "opal",
    "fossils",
    "silver",
    "platinum",
    "rubies",
    "emeralds",
  ];

  MountainResourceGenerator() : super(_resources);
}
