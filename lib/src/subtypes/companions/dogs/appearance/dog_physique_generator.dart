import '../../../../generators/base/list_item_generator.dart';

/// A class that generates fur color of dogs
class DogPhysiqueGenerator extends ListItemGenerator<String> {
  static const _physique = [
    'small',
    'medium',
    'large',
    'muscular',
    'lean',
    'stocky',
    'slender',
    'compact',
    'sturdy',
    'athletic',
    'graceful',
    'robust',
    'brawny',
    'solid',
    'lithe',
    'powerful',
    'slim',
    'chunky',
    'petite',
    'compact'
  ];

  DogPhysiqueGenerator() : super(_physique);
}
