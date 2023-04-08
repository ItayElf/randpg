import '../../../../generators/base/list_item_generator.dart';

/// A class that generates weathers at swamps
class SwampWeatherGenerator extends ListItemGenerator<String> {
  static const _weathers = [
    "is humid",
    "is warm all year long",
    "is extremely rainy",
    "suffers from rare acidic rain",
    "is especially fusty",
    "has a damp weather",
    'is prone to sudden and heavy fog',
    'is humid and muggy, with a constant haze in the air',
    'experiences frequent thunderstorms and lightning strikes',
    'is known for its intense heat and oppressive humidity',
    'is subject to flash floods during periods of heavy rainfall',
    'has a persistent drizzle that never seems to stop',
    'is prone to long periods of drought followed by sudden, intense downpours',
    'has a cold and damp climate, with frequent mist and fog',
    'is buffeted by strong winds that whip across the open waters and through the dense vegetation',
    'experiences extreme fluctuations in temperature, from scorching heat during the day to bone-chilling cold at night',
    'is often shrouded in a thick, heavy mist that obscures vision and makes navigation difficult',
    'is subject to frequent thunderstorms and high winds, which can uproot trees and cause flooding',
    'is characterized by a constant, low-level humidity that makes everything feel damp and sticky',
    'is prone to sudden and severe temperature drops, which can cause dangerous ice formations to appear in the swamp waters'
  ];

  SwampWeatherGenerator() : super(_weathers);
}
