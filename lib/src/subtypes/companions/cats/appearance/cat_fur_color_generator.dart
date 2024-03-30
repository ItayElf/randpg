import '../../../../generators/base/list_item_generator.dart';

/// A class that generates fur color of cats
class CatFurColorGenerator extends ListItemGenerator<String> {
  static const _colors = [
    'black',
    'white',
    'gray',
    'brown',
    'orange',
    'cream',
    'reddish',
    'chocolate',
    'cinnamon',
    'fawn',
    'silver',
    'golden',
    'smoked',
    'tortoiseshell',
    'tricolor',
    'bicolor',
    'spotted',
    'marbled',
    'striped',
  ];

  CatFurColorGenerator() : super(_colors);
}
