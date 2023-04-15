import '../../base/list_item_generator.dart';

/// A class that generates an occupation for an important figure in the settlement
class SettlementOccupationsGenerator extends ListItemGenerator<String> {
  static const _settlementOccupations = [
    "mayor",
    "minister",
    "guard",
    "noble",
    "leader",
    "crime lord",
    "criminal",
    "diplomat",
    "guide",
    "soldier",
    "high priest",
    "guild leader",
    "adventurer",
    "messenger"
  ];

  SettlementOccupationsGenerator() : super(_settlementOccupations);
}
