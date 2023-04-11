import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about gnomes
class GnomeOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    "absent minded",
    "pranksters",
    "cowards and shy",
    'crafty and inventive',
    'mischief-makers and pranksters',
    'expert tinkers and inventors',
    'deeply curious and always exploring',
    'skilled illusionists and tricksters',
    'small but surprisingly strong and resilient',
    'obsessed with collecting oddities and curiosities',
    'distrustful of outsiders and strangers',
    'tenacious and never giving up easily',
    'masters of mining and metalworking',
    'quick-witted and always ready with a clever remark',
    'fiercely loyal to their friends and family',
    'secretive and difficult to read',
    'fond of complex machinery and gadgets',
  ];

  GnomeOpinionGenerator() : super(_opinions);
}
