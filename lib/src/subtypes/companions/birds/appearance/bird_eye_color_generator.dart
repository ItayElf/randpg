import '../../../../generators/base/list_item_generator.dart';

/// A class that generates eye color of birds
class BirdEyeColorGenerator extends ListItemGenerator<String> {
  static const _eyeColors = [
    'black',
    'brown',
    'amber',
    'hazel',
    'yellow',
    'orange',
    'red',
    'green',
    'blue',
    'gray',
    'gold',
    'silver',
    'copper'
  ];

  BirdEyeColorGenerator() : super(_eyeColors);
}
