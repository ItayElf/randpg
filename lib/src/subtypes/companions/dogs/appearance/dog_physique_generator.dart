import '../../../../generators/base/list_item_generator.dart';

/// A class that generates body types of dogs
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
    'compact',
    'agile',
    'nimble',
  ];

  DogPhysiqueGenerator() : super(_physique);
}
