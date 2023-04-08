import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at forests
class ForestWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    "is cold all year long",
    "is warm all year long",
    "has a mild weather",
    "suffers from occasional fires during the summer",
    "is rainy most of the year",
    "is foggy",
    'experiences heavy snowfall during the winter',
    'is subject to frequent thunderstorms during the summer',
    'is extremely dry during certain months of the year',
    'is prone to flooding during the rainy season',
    'has a hot and humid climate year-round',
    'has a cool and dry climate year-round',
    'experiences strong winds throughout the year',
    'is often shrouded in mist or haze',
  ];

  ForestWeatherGenerator() : super(_weathers);
}
