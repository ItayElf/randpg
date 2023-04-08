import '../../../../generators/base/list_item_generator.dart';

/// A class that generates tundra sizes
class TundraSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'extends as far as the eye can see',
    'is a vast, icy plateau that rises high above the surrounding landscape',
    'spans a seemingly endless expanse of frozen hills and valleys',
    'is a broad expanse of frozen plains, stretching out in all directions',
    'is a desolate, frozen wasteland that seems to go on forever',
    'is a vast expanse of frozen tundra',
    'is a broad swath of frozen wilderness',
    'is a vast expanse of frozen tundra, broken only by occasional rocky outcrops',
    'covers an area equivalent to a small country',
    'covers an area equivalent to a large country',
    'is a small tundra',
    'is a medium-sized tundra',
    'is a large tundra',
    'is one of the smallest tundras in the continent',
    'is one of the largest tundras in the continent',
    'spreads across multiple countries',
  ];

  TundraSizeGenerator() : super(_sizes);
}
