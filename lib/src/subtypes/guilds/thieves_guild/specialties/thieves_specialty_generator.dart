import '../../../../generators/base/list_item_generator.dart';

/// A class that generates specialties of a thieves guild
class ThievesSpecialtyGenerator extends ListItemGenerator<String> {
  static const _specialties = [
    'pickpocketing',
    'safecracking',
    'forgery',
    'lockpicking',
    'intelligence gathering',
    'assassination',
    'infiltration',
    'burglary',
    'smuggling',
    'counterfeiting',
    'fencing stolen goods',
    'kidnapping and ransom',
    'extortion',
    'arson',
    'sabotage',
    'bribing officials',
    'con artistry',
    'disguise and impersonation',
    'interrogation',
    'espionage',
    'magical theft',
    'poisoning',
    'distraction and diversion',
    'road robberies',
    'hunting and tracking',
    'mercenary work',
    'street performance scams',
    'gambling',
    'breaking and entering',
    'deception',
    'altering documents and records',
    'tunneling',
    'impersonating guards or other authority figures',
    'smokescreening',
    'acquiring rare and valuable items',
    'silent strikes',
    'treasure hunting',
    'pillaging and plundering',
  ];

  ThievesSpecialtyGenerator() : super(_specialties);
}
