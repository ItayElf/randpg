import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at mountains
class MountainsWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    "are warm during the summer",
    "suffer from occasional avalanches",
    "have unpredictable weather",
    'experience frequent thunderstorms and lightning strikes',
    'are constantly buffeted by strong winds',
    'have harsh, freezing temperatures year-round',
    'suffer from heavy snowfall during the winter months',
    'are frequently shrouded in fog and mist',
    'have a dry, arid climate',
    'experience frequent rock slides and landslides',
    'are subject to sudden, intense storms that can cause flash flooding',
    'have a mild climate, with temperatures remaining relatively consistent throughout the year',
    'experience a high degree of humidity and precipitation',
    'are prone to thunderstorms during the summer months',
    'have dry and arid weather conditions',
    'experience frequent snowstorms during the winter',
    'have strong and persistent winds that make it difficult to climb',
    'are characterized by long periods of fog and mist',
    'experience extreme temperature fluctuations throughout the year',
    'are prone to sudden and intense blizzards',
    'have a high incidence of lightning strikes during storms',
    'experience heavy snowfall during the winter but dry weather during the summer',
    'have a humid subtropical climate with hot summers and mild winters',
    'experience frequent thunderstorms during the spring and summer',
  ];

  MountainsWeatherGenerator() : super(_weathers);
}
