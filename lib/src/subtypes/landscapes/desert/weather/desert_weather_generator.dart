import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at deserts
class DesertWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    'is scorching hot during the day and freezing cold at night',
    'has a monsoon season with heavy rainfall and thunderstorms',
    'experiences a constant gentle breeze',
    'is prone to intense sandstorms',
    'has a tropical climate with high humidity',
    'is sunny and dry all year round with very little precipitation',
    'has a constantly changing weather, with sudden and unpredictable storms',
    'has a persistent overcast sky, rarely seeing the sun',
    'experiences a prolonged drought, causing water scarcity',
    'is prone to flash floods during the rainy season',
    'is humid and muggy during the summer months, leading to discomfort',
    'is windy and prone to tornadoes',
    'has a cold and dry climate with occasional snowfall',
    'has a short but intense rainy season with heavy downpours',
    'is foggy and misty throughout the year, leading to low visibility',
    'experiences extreme temperature fluctuations between day and night',
  ];

  DesertWeatherGenerator() : super(_weathers);
}
