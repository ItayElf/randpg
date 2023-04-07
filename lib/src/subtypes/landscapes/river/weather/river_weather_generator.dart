import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at rivers
class RiverWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    "is icy and frozen during the winter months",
    "is plagued by frequent droughts",
    "is subject to sudden, intense downpours",
    "has a constant, gentle breeze flowing downstream",
    "is constantly shrouded in a thick, eerie fog",
    "is buffeted by strong currents and rapids",
    'is subject to frequent flash floods during heavy rain',
    'is often shrouded in a dense fog in the early morning and late evening',
    'is known for its swirling mists and unpredictable currents',
    'is often buffeted by strong, gusty winds',
    "has a steady current all year round",
    "is fully dry during the summer",
  ];

  RiverWeatherGenerator() : super(_weathers);
}
