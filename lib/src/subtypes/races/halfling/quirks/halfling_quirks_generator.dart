import '../../../../generators/base/list_item_generator.dart';

/// A class that generates a halfling personality quirk
class HalflingPersonalityQuirkGenerator extends ListItemGenerator<String> {
  static const _halflingQuirks = [
    'tries to stay home as much as possible',
    'usually tries not to get noticed',
    'is very shy',
    'has several pet animals',
    'rides a pony everywhere',
    'always has a good joke to tell',
    'knows all there is to know about farms',
    'lived the early years in a caravan',
    'never goes anywhere without the best friend',
    'smiles constantly',
    'values the community very highly'
  ];

  HalflingPersonalityQuirkGenerator() : super(_halflingQuirks);
}
