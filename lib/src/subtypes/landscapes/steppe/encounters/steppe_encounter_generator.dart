import '../../../../generators/base/list_item_generator.dart';

/// A class that generates steppe encounters
class SteppeEncounterGenerator extends ListItemGenerator<String> {
  static const _encounters = [
    "wild horses",
    "dire wolves",
    "giant wolves",
    "hyenas",
    "giant hyenas",
    "ogres",
    "tigers",
    "bandits",
    "centaurs",
    "giant boars",
    "giant elks",
    "orcs",
    "owlbears",
    "trolls",
    "leopards",
    "giant bisons",
    "bisons",
    "hippogriffs",
    "green dragons",
    "wooly camels",
    "orcs",
    "raiders",
    "giant hawks",
  ];

  SteppeEncounterGenerator() : super(_encounters);
}
