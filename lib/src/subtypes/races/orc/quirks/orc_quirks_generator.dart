import '../../../../generators/base/list_item_generator.dart';

/// A class that generates an orcish personality quirk
class OrcPersonalityQuirkGenerator extends ListItemGenerator<String> {
  static const _orcQuirks = [
    'only respects powerful and competent leaders',
    "openly mocks human society's structure.",
    'occasionally challenges others to duels to the death',
    'will turn anything into an opportunity for training',
    'enjoys messing with other humanoids with smeller stature',
    'dislikes depending on others',
    'maintains a friendly relationships with nearby trolls'
  ];

  OrcPersonalityQuirkGenerator() : super(_orcQuirks);
}
