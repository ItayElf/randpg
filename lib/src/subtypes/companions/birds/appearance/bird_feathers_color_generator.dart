import '../../../../generators/base/list_item_generator.dart';

/// A class that generates feathers color of birds
class BirdFeathersColorGenerator extends ListItemGenerator<String> {
  static const _colors = [
    'black',
    'black',
    'white',
    'white',
    'gray',
    'gray',
    'brown',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
  ];

  BirdFeathersColorGenerator() : super(_colors);
}
