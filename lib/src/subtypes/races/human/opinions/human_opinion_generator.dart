import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about humans
class HumanOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'wary of magic',
    'diverse and adaptable',
    'ambitious and driven',
    'inventive and innovative',
    'creative and expressive',
    'resourceful and determined',
    'capable of great kindness and compassion',
    'prone to conflict and violence',
    'eager to explore and discover',
    'able to form deep and meaningful relationships',
    'capable of great feats of bravery and heroism',
    'often struggling with their own mortality and impermanence',
    'able to learn and master a wide range of skills',
    'often consumed with a sense of purpose or destiny',
    'able to form complex societies and civilizations',
    'often seeking power and influence over others',
    'easy to fall to evil',
  ];

  HumanOpinionGenerator() : super(_opinions);
}
