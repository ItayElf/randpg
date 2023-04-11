import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about halflings
class HalflingOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'dumb and foolhardy',
    'little bandits',
    "a bit too curious",
    'friendly killers',
    'easy to miss',
    'fiercely loyal',
    'friendly and hospitable',
    'nimble and quick on their feet',
    'skilled farmers and cooks',
    'contented with simple pleasures',
    'fond of storytelling and lore',
    'curious and adventurous, despite their small size',
    'excellent at hiding and remaining unnoticed',
    'in possession of strong sense of community and family',
    'practical and resourceful',
    'great travelers and wanderers',
    'fond of games and competitions',
    'skilled traders and merchants',
    'fiercely protective of their homes and families',
    'slow to adapt to new situations and surroundings',
  ];

  HalflingOpinionGenerator() : super(_opinions);
}
