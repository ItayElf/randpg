import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about dragonborns
class DragonbornOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'spies for dragons',
    'thugs and brigands',
    'invading monsters',
    'majestic and regal',
    'cold and aloof',
    'respectful for tradition and history',
    'fierce defenders of their territories',
    'devoutly religious',
  ];

  DragonbornOpinionGenerator() : super(_opinions);
}
