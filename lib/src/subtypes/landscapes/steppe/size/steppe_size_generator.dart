import '../../../../generators/base/list_item_generator.dart';

/// A class that generates steppe sizes
class SteppeSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'spans across thousands of kilometers of open grasslands',
    'takes up a small portion of the continent',
    'is a vast, rolling plain that extends for hundreds of kilometers',
    'is a small, isolated patch of greenery',
    'covers an entire portion of the continent',
    'is a thin strip of greenery that hugs the coastline',
    'is a massive, unbroken expanse of grasslands',
    'is a series of interconnected meadows and fields',
    'covers the majority of the region, with only a few small towns and villages scattered throughout',
    'is a relatively small area of steppe',
    'is a vast plain',
    'stretches from one coast to the other, covering a significant portion of the continent',
    'is a broad, sweeping plain that extends to the horizon in all directions',
    'is a relatively small steppe',
    'is a wide and open expanse of grassland',
    'is a small and isolated area of steppe',
    'is a vast steppe',
    'is a broad swath of grasslands',
    'is a narrow strip of steppe that follows the course of a winding river',
  ];

  SteppeSizeGenerator() : super(_sizes);
}
