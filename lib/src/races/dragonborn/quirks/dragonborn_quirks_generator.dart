import '../../../generators/base/list_item_generator.dart';

/// A class that generates a dragonborn personality quirk
class DragonbornPersonalityQuirkGenerator extends ListItemGenerator<String> {
  static const _dragonbornQuirks = [
    'never asks for help',
    'sees other races as inferior',
    'keeps all of the promises',
    'despises fear and cowardice',
    'treats adversaries with respect',
    'values honor above all',
    'cannot use the breath weapon',
    'has a secret dragon master',
    'values the clan above anything else'
  ];

  DragonbornPersonalityQuirkGenerator() : super(_dragonbornQuirks);
}
