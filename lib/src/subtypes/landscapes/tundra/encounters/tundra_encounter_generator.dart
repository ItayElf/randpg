import '../../../../generators/base/list_item_generator.dart';

/// A class that generates tundra encounters
class TundraEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    "yetis",
    "frost giants",
    "white dragons",
    "snow leopards",
    "giant arctic wolves",
    "arctic wolves",
    "snow sprites",
    "ice elementals",
    "polar bears",
    "giant bears",
    "trolls",
    "giant snow owls",
    "snow owls",
    "arctic foxes",
    "saber-tooth tigers",
    "giant saber-tooth tigers",
    "mammoths",
    "ice hags",
    "orcs",
    "zombies",
    "owldragon",
    "giant hawks",
    "wooly mammoths",
    "cave lions",
    "giant cave lions",
    "reindeers",
    "giant reindeers",
    "musk oxen",
    "giant musk oxen"
  ];

  TundraEncounterGenerator() : super(_encounters);
}
