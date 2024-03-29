import '../../../../generators/base/list_item_generator.dart';

/// A class that generates eye color of dogs
class DogEyeColorGenerator extends ListItemGenerator<String> {
  static const _eyeColors = [
    'brown',
    'blue',
    'amber',
    'green',
    'hazel',
    'gray',
    'black',
    'gold',
    'red',
    'bi-colored',
    'parti-colored'
  ];

  DogEyeColorGenerator() : super(_eyeColors);
}
