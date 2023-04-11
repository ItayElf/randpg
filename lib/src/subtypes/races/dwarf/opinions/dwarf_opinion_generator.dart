import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about dwarfs
class DwarfOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'have the best ale',
    'thugs and brigands',
    'expert craftsmen and skilled engineers',
    'hardworking and industrious',
    'lovers of gold and treasure',
    'steadfast and loyal companions',
    'stoic and unyielding',
    'stubborn and inflexible',
    'highly disciplined and regimented',
    'fiercely protective of their homes and families',
    'fond of ale and hearty food',
    'prone to grudges and vendettas',
    'deeply traditional and respectful of their ancestors',
    'masters of mining and underground construction',
    'wary of magic and anything they cannot control',
    'excellent fighters and skilled tacticians'
  ];

  DwarfOpinionGenerator() : super(_opinions);
}
