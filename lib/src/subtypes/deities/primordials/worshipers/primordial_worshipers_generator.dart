import '../../../../generators/base/list_item_generator.dart';

/// A class that generates a description for primordials worshipers
class PrimordialWorshipersGenerator extends ListItemGenerator<String> {
  static const _worshipers = [
    "no",
    "monsters",
    "druids",
    "elementals",
    "shamans",
    "monks",
    "almost no",
    "lost",
    "lesser deities",
    "witches and warlocks",
  ];

  PrimordialWorshipersGenerator() : super(_worshipers);
}
