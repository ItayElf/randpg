import '../../../../generators/base/list_item_generator.dart';

/// A class that generates desert sizes
class DesertSizeGenerator extends ListItemGenerator<String> {
  static const _sizes = [
    'is one of the largest deserts in the continent',
    'is one of the smallest deserts in the continent',
    'covers an area of several hundred square kilometers',
    'is a vast, arid wasteland that seems to stretch on endlessly',
    'is a relatively small desert, covering only a few dozen square kilometers',
    'is one of the most barren and inhospitable regions on the continent',
    'is a desert of moderate size, covering an area roughly equivalent to a small country',
    'is a seemingly endless expanse of sand dunes',
    'spans across multiple countries and continents',
    'is a relatively small desert, but one that is known for its extreme temperatures',
    'is a vast desert',
    'is a desert of moderate size',
    'is a small desert',
    'is a desert of average size',
    'is a medium sized desert that is slowly expanding',
  ];

  DesertSizeGenerator() : super(_sizes);
}
