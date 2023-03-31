import '../../../base/list_item_generator.dart';

/// A class that generates zones in settlements
class BaseZoneGenerator extends ListItemGenerator<String> {
  static const _zones = [
    'the arcane quarter',
    'a small alley',
    'a major crossroads',
    'the main street near the settlement\'s gate',
    'the market district',
    "the artisan's district",
    'the middle of the slums',
    'a well-lit avenue with guard towers',
    'the temple ward',
    'a side street near the town gate',
    "the adventurer's district",
    'the market quarter',
    'the temple district',
    'the civic quarter',
    'the residential district',
  ];

  BaseZoneGenerator() : super(_zones);
}
