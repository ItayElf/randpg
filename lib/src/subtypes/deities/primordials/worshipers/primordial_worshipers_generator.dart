import 'package:randpg/generators/generators.dart';

/// A class that generates a description for primordials worshipers
class PrimordialWorshipersGenerator extends ListItemGenerator<String> {
  static const _worshipers = [
    "no",
    "monsters as",
    "druids as",
    "elementals as",
    "shamans as",
    "monks as",
    "almost no",
    "lost",
    "lesser deities as",
    "witches and warlocks as",
  ];

  PrimordialWorshipersGenerator() : super(_worshipers);
}
