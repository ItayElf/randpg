import '../../base/list_item_generator.dart';

/// A class that generates something a landscape might be known for
class LandscapeKnownForGenerator extends ListItemGenerator<String> {
  static const _knownFor = [
    "people who enter but never leave",
    "its diverse wildlife",
    "its diverse vegetation",
    "its lack of wildlife",
    "an important event that took place in it",
    "an horrible event that took place in it",
    "an important person who live in it",
    "its abundance of resources",
    "unusual activities",
    "an hideout of a guild or a cult",
    "strange and powerful magical energies that permeate the area, making it a hub for magical activity or experimentation",
    "a legend or prophecy that revolves around the landscape, leading many adventurers to seek out its secrets",
    "an ancient civilization or race that once inhabited the area, leaving behind ruins, artifacts, and secrets to uncover",
    "the presence of a powerful deity or other divine being, worshipped by the inhabitants of the area or feared by those who enter",
    "a unique or rare type of natural phenomenon",
    "the malevolent spirits or undead creatures that roam its grounds",
    "rare or powerful magical creature",
    "being blessed by a powerful being",
    "being cursed by a powerful being",
    "a powerful or legendary weapon, artifact, or relic that is believed to be found in this location",
    'a natural disaster that struck the area, leaving behind a devastated and eerie landscape',
    'being a site of a long-forgotten battle or war, where the remains of ancient armies and fortifications can still be found',
    'a haven for refugees or outcasts seeking shelter from persecution or conflict',
    'an area of extreme natural beauty, with picturesque landscapes and breathtaking vistas',
    'an infamous monster or villain that terrorizes the area, making it a place of fear and danger',
    'a place of pilgrimage or worship, where devotees of a particular religion or cult come to pay homage to their deity or belief',
    'a cursed or haunted location, where those who enter are plagued by supernatural forces or tormented by vengeful spirits',
  ];

  LandscapeKnownForGenerator() : super(_knownFor);
}
