import '../../../../generators/base/list_item_generator.dart';

/// A class that generates swamp sizes
class SwampSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'covers an area of several hundred square kilometers',
    'spans for tens of kilometers in every direction',
    'stretches as far as the eye can see',
    'takes up a significant portion of the surrounding landscape',
    'extends for kilometers along the riverbank',
    'is contained within a natural basin, making it appear smaller than it actually is',
    'is a patchwork of small, interconnected wetlands',
    'forms a massive, swampy delta where several rivers converge',
    'is a winding, serpentine waterway that flows through a narrow valley',
    'consists of a series of interconnected pools and marshes that ebb and flow with the tides',
    'covers an area roughly the size of a small kingdom',
    'is little more than a small, stagnant pool',
    'is a sprawling wetland that spans several different biomes',
    'occupies a narrow strip of land that runs along the coast',
    'is so vast that locals speak of it as a separate world',
    'is a series of small, isolated ponds and bogs',
    'is a relatively small, but densely packed swamp',
    'takes up most of the valley floor, stretching for kilometers in every direction',
    'is a swampy wilderness that covers a significant portion of the region',
    'is a relatively small but deep and treacherous swamp',
    'is a wide, shallow swamp with a gently sloping shoreline',
    'is a sprawling, boggy lowland that stretches across several different regions',
  ];

  SwampSizeGenerator() : super(_sizes);
}
