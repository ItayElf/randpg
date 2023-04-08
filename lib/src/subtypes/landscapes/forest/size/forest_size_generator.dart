import '../../../../generators/base/list_item_generator.dart';

/// A class that generates forest sizes
class ForestSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    "is one of the largest forests in the continent",
    "is one of the smallest forests in the continent",
    "is a large forest",
    "is a small forest",
    'spreads across several mountain ranges',
    'takes up a large portion of the continent',
    'is broken up into several smaller sections',
    'extends into multiple neighboring countries',
    'covers only a small area',
    'is one of the largest forest in the continent',
    'is one of the smallest forests in the continent',
    'is a vast expanse of trees that stretches as far as the eye can see',
    'is a tiny oasis of green',
    'is a sprawling forest that spans multiple continents',
    'is a thick forest that covers the majority of the region',
  ];

  ForestSizeGenerator() : super(_sizes);
}
