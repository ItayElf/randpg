import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/races/goblin/goblin.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'race.dart';
import 'dragonborn/dragonborn.dart';
import 'dwarf/dwarf.dart';
import 'elf/elf.dart';
import 'gnome/gnome.dart';
import 'halfling/halfling.dart';
import 'human/human.dart';
import 'hybrid/hybrids/half_elf.dart';
import 'hybrid/hybrids/half_orc.dart';
import 'orc/orc.dart';
import 'tiefling/tiefling.dart';

/// A class that handles the available races and using them
///
/// When making a custom race, make sure to register it or else some features might not work
class RaceManager extends Manager<Race> {
  const RaceManager();

  static final Set<Race> _races = {
    Dragonborn(),
    Dwarf(),
    Elf(),
    Gnome(),
    HalfElf(),
    HalfOrc(),
    Halfling(),
    Human(),
    Orc(),
    Tiefling(),
    Goblin(),
  };

  static final Set<Race> _activeRaces = {..._races};

  /// Returns all the races
  @override
  List<Race> get allTypes => _races.toList()..sortBy((race) => race.getName());

  /// Returns all active races
  @override
  List<Race> get activeTypes =>
      _activeRaces.toList()..sortBy((race) => race.getName());

  /// Returns the corresponding race from all races called [name]
  @override
  Race getType(String name) {
    return _races.firstWhere(
      (race) => race.getName() == name,
      orElse: () =>
          throw RaceNotFoundException("Race with name $name was not found"),
    );
  }

  /// Adds [race] to the list of all races and active races
  @override
  void registerType(Race race) {
    _races.add(race);
    _activeRaces.add(race);
  }

  /// Removes [race] only from the active races
  @override
  void unregisterType(Race race) {
    _activeRaces.remove(getType(race.getName()));
  }

  /// Removes [race] from the active races and from all races lists
  @override
  void deleteType(Race race) {
    final foundRace = getType(race.getName());
    _races.remove(foundRace);
    _activeRaces.remove(foundRace);
  }
}
