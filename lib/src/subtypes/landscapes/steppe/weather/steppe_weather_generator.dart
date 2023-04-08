import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at steppes
class SteppeWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    'has a temperate climate with mild summers and winters',
    'has constant, fierce winds',
    'has a dry, desert-like climate with little rainfall',
    'experiences heavy snowfall and blizzards during the winter months',
    'has a monsoon season with heavy rains and flooding',
    'has a tropical climate with high humidity and frequent thunderstorms',
    'is prone to droughts during certain seasons',
    'has a moderate climate with warm summers and cool winters',
    'has a cold, harsh climate with freezing temperatures and strong winds',
    'is prone to tornadoes and severe thunderstorms during the spring and summer',
    'has a wet, rainy climate with frequent showers throughout the year',
    'experiences a wet and dry season, with heavy rains followed by long periods of drought',
    'is prone to hailstorms and severe winter weather',
    'experiences extreme weather conditions, including intense cold and strong winds',
    'has a tropical climate with distinct wet and dry seasons',
    'experiences hot, dry summers and cold, snowy winters',
    'has a coastal climate with mild temperatures and high humidity',
    'is prone to heat waves during the summer months',
    'has a polar climate with bitterly cold temperatures and long, dark winters',
    'has a desert climate with hot days and cool nights',
    'is known for its frequent fog and low-lying clouds',
    'has a climate with mild temperatures and low rainfall',
    'is prone to typhoons and tropical storms during certain months of the year',
    'has a climate with warm, wet summers and mild winters',
    'suffers from extreme weather conditions, including tornadoes, thunderstorms, blizzards, and heat waves',
  ];

  SteppeWeatherGenerator() : super(_weathers);
}
