import '../../../../generators/base/list_item_generator.dart';

/// A class that generates opinions specifically about tieflings
class TieflingOpinionGenerator extends ListItemGenerator<String> {
  static const _opinions = [
    "spies for devils",
    "evil and untrustworthy",
    'often misunderstood and feared',
    'possessing a mysterious and alluring aura',
    'able to charm and manipulate others with their words',
    'often plagued by a sense of isolation and loneliness',
    'enduring persecution and discrimination from others',
    'able to harness dark powers and magic',
    'often struggling with inner demons and conflicting emotions',
    'able to form strong bonds with those who accept them',
    'capable of great acts of heroism and self-sacrifice',
    'often viewed with suspicion and distrust by others',
    'able to blend in and disguise themselves in a variety of environments',
    'fiercely independent and resistant to authority',
    'able to tap into the power of their ancestry to fuel their own magic',
  ];

  TieflingOpinionGenerator() : super(_opinions);
}
