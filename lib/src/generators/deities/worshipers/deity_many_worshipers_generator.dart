import 'package:randpg/generators/generators.dart';

/// A class that generates a description for how many worshippers a deity has
class DeityManyWorshipersGenerator extends ListItemGenerator<String> {
  static const _worshipers = [
    "numerous",
    "various",
    "plentiful",
    "many",
    "countless",
    "innumerable",
    "a good amount of",
    "copious",
    "varied",
    "infinite",
    "plenty of",
    "a considerable amount of",
    "an increasing number of",
    "a decreasing number of",
    "sufficient amount of",
  ];

  DeityManyWorshipersGenerator() : super(_worshipers);
}
