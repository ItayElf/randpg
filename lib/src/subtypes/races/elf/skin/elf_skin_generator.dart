import '../../../../generators/base/list_item_generator.dart';

/// A class that generates elven skin tones
class ElfSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = [
    "white",
    "pale",
    "brown",
    'blueish',
    'pink',
    'golden',
    'silver',
    'green',
    'copper'
  ];

  ElfSkinGenerator() : super(_skinTones);
}
