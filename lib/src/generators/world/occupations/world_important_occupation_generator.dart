import '../../base/list_item_generator.dart';

/// A class that generates occupations for important figures in the world
class WorldImportantOccupationGenerator extends ListItemGenerator<String> {
  static const _occupations = [
    "high priest",
    "archmage",
    "high general",
    "master craftsman",
    "guild leader",
    "master bard",
    "scholar",
    "high druid",
    "noble",
    "diplomat",
    "chief advisor",
    "legendary hero",
    "master hunter",
    "master mercenary",
    "master criminal",
    "explorer",
  ];

  WorldImportantOccupationGenerator() : super(_occupations);
}
