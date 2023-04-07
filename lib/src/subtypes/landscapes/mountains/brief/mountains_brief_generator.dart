import '../../../../generators/base/list_item_generator.dart';

/// A class that generates briefs for mountains
class MountainsBriefGenerator extends ListItemGenerator<String> {
  static const _briefs = [
    "are active volcanos",
    "are made out of black stone",
    "are made out gray stone",
    "are covered by short vegetation",
    "are dormant volcanos",
    'are towering spires of jagged rock',
    'are shrouded in mist and fog',
    'are snow-capped year-round',
    'have sheer cliffs and narrow ridges',
    'are surrounded by deep canyons',
    'are home to hot springs and geysers',
    'are covered in dense forests at the base',
    'are honeycombed with caves and tunnels',
    'are dotted with crystal-clear alpine lakes',
    "are home to hot springs and geysers",
    "are covered in dense forests up to a certain elevation",
    "have steep and winding roads leading to the summit",
    "have hidden caves and tunnels within their depths",
  ];

  MountainsBriefGenerator() : super(_briefs);
}
