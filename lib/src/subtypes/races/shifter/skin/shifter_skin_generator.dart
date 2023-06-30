import '../../../../generators/base/list_item_generator.dart';

/// A class that generates shifter skin tones
class ShifterSkinGenerator extends ListItemGenerator<String> {
  static const _skinTones = [
    'light brown',
    'dark brown',
    'tan',
    'sandy',
    'beige',
    'amber',
    'pale gray',
    'ashen',
    'olive',
    'mottled gray and brown',
    'earthy tones',
    'tawny',
    'coppery',
    'golden',
    'rusty',
    'sienna',
    'reddish-brown',
    'dusky',
    'slate gray',
    'ebony'
  ];

  ShifterSkinGenerator() : super(_skinTones);
}
