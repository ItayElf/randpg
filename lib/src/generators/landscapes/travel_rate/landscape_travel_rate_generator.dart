import '../../base/list_item_generator.dart';

/// A class that generates travel rates for landscapes
class LandscapeTravelRateGenerator extends ListItemGenerator<String> {
  static const _travelRate = [
    "never",
    "sporadically",
    "occasionally",
    "intermittently",
    "frequently",
    "constantly",
    'rarely',
    'infrequently',
    'seasonally',
    'regularly',
    'routinely',
    'continuously',
    'inconsistently',
  ];

  LandscapeTravelRateGenerator() : super(_travelRate);
}
