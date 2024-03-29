import '../../../../generators/base/list_item_generator.dart';

/// A class that generates fur color of dogs
class DogFurColorGenerator extends ListItemGenerator<String> {
  static const _adjectives = [
    'black',
    'brown',
    'white',
    'gray',
    'golden',
    'cream',
    'reddish',
    'fawn',
    'brindle',
    'merle',
    'tan',
    'silver',
    'apricot',
    'buff',
    'chocolate',
    'cinnamon',
  ];

  DogFurColorGenerator() : super(_adjectives);
}
