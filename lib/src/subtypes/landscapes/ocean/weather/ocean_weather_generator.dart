import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at oceans
class OceanWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    "is battered by strong, frigid winds",
    "has a tropical climate with high temperatures and frequent rainfall",
    "is often hit by typhoons or hurricanes during certain seasons",
    "has a hot and dry climate, with scarce rainfall and intense sunlight",
    "is affected by a monsoon season, with heavy rain and flooding",
    "has a subtropical climate with mild winters and hot summers",
    "experiences a prolonged rainy season followed by a dry season",
    "is characterized by frequent and sudden thunderstorms that can be dangerous for boaters",
    "has a foggy and misty climate with a high level of humidity",
    "is subject to unpredictable weather changes, with sudden gusts of wind and unexpected storms",
    "is frequently covered in a thick layer of sea mist, reducing visibility for boaters",
    "has a humid continental climate with hot summers and cold winters",
    "is prone to frequent and severe cyclones and tornadoes",
    "experiences a constant, steady rainfall throughout the year",
    "is known for its strong and unpredictable currents, which can be dangerous for swimmers and boaters",
    "is often battered by heavy snowstorms and blizzards during the winter months",
    "is subject to regular and intense heatwaves, which can be harmful for marine life",
    "has a cool, damp climate with a persistent drizzle and occasional hailstorms",
    "has a desert-like climate with scorching hot temperatures during the day and freezing cold temperatures at night",
    "is affected by a seasonal monsoon, which brings heavy rain and strong winds",
    "is subject to frequent and intense lightning storms, which can be dangerous for boaters",
    "is known for its mild and pleasant climate, with warm summers and cool winters",
    "is often battered by strong and persistent trade winds, which can make sailing difficult",
    "has a polar climate with bitterly cold temperatures and long periods of darkness during the winter months",
  ];

  OceanWeatherGenerator() : super(_weathers);
}
