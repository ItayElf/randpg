import '../../../../generators/base/list_item_generator.dart';

/// A class that generates body types of birds
class BirdPhysiqueGenerator extends ListItemGenerator<String> {
  static const _physique = [
    'slender',
    'compact',
    'graceful',
    'athletic',
    'muscular',
    'robust',
    'sleek',
    'elegant',
    'agile',
    'nimble',
    'lithe',
    'sturdy',
    'stocky',
    'solid',
    'powerful',
    'small',
    'medium-sized',
    'large',
    'plump',
    'curvy',
    'long-legged',
    'short-legged',
    'long-necked',
    'short-necked',
    'streamlined',
    'majestic',
    'regal',
    'delicate',
    'dainty',
    'chubby',
    'bulky'
  ];

  BirdPhysiqueGenerator() : super(_physique);
}
