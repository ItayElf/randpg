import '../../base/list_item_generator.dart';

/// A class that generates a description for how many worshippers a deity has
class DeityFewWorshipersGenerator extends ListItemGenerator<String> {
  static const _worshipers = [
    "a few",
    "scarce",
    "hardly any",
    "several",
    "almost no",
    "some",
    "a handful",
    "a small number of",
    "a couple",
    "rare",
    "limited",
    "an decreasing number of",
    "not enough",
  ];

  DeityFewWorshipersGenerator() : super(_worshipers);
}
