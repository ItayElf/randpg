import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about elves
class ElfOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    'vain and aristocratic',
    'stuck up and distant',
    "aloof and taciturn",
    'ancient wizards',
    'graceful and agile',
    'masters of archery and swordplay',
    'mysterious and enigmatic',
    'in tune with nature and the natural world',
    'haughty and arrogant',
    'elegant and sophisticated',
    'long-lived and wise',
    'inherently magical and connected to the arcane',
    'effortlessly beautiful and alluring',
    'fiercely independent and free-spirited',
    'distrustful of humans and other races',
    'unforgiving and quick to hold a grudge',
    'protectors of ancient knowledge and lore',
    'gifted healers and skilled in herbalism',
    'aloof and distant, with little concern for mortal affairs',
  ];

  ElfOpinionGenerator() : super(_opinions);
}
