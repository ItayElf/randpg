import 'package:randpg/generators/generators.dart';

/// A class that generates a description for how many worshippers a deity has
class DeityWorshipersGenerator extends ListItemGenerator<String> {
  static const _worshipers = [
    "numerous",
    "a few",
    "various",
    "plentiful",
    "scarce",
    "many",
    "countless",
    "innumerable",
    "hardly any",
    "several",
    "a good amount of",
    "almost no",
    "some",
    "copious",
    "a handful",
    "a small number of",
    "a couple",
    "varied",
    "rare",
    "limited",
    "infinite",
    "plenty of",
    "a considerable amount of",
    "an increasing number of",
    "an decreasing number of",
    "not enough",
    "sufficient amount of",
  ];

  DeityWorshipersGenerator() : super(_worshipers);
}
