import '../../../../generators/base/list_item_generator.dart';

/// A class that generates activities that monkeys often do
class MonkeyActivityGenerator extends ListItemGenerator<String> {
  static const _activities = [
    'balance',
    'chase',
    'chatter',
    'climb',
    'dig',
    'drum',
    'eat',
    'explore',
    'forage',
    'groom',
    'hang',
    'hoard',
    'jump',
    'leap',
    'make',
    'mimic',
    'observe',
    'peek',
    'play',
    'rest',
    'roll',
    'scratch',
    'snatch',
    'snuggle',
    'splash',
    'steal',
    'swing',
    'tease',
    'throw',
    'tug',
    'wrestle'
  ];

  MonkeyActivityGenerator() : super(_activities);
}
