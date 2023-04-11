import 'package:randpg/src/generators/base/list_item_generator.dart';

class WorldImportantOccupationGenerator extends ListItemGenerator<String> {
  static const _occupations = [
    "monarch",
    "high priest",
    "archmage",
    "high general",
    "master craftsman",
    "guild leader",
    "master bard",
    "scholar",
    "high druid",
    "noble",
    "cult leader",
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
