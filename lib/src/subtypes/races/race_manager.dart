import '../../randpg_exceptions.dart';
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
abstract class RaceManager {
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
  };

  static final Set<Race> _activeRaces = {..._races};

  /// Returns all the races
  static List<Race> get allRaces => _races.toList();

  /// Returns all active races
  static List<Race> get activeRaces => _activeRaces.toList();

  /// Returns the corresponding race from all races called [name]
  static Race getRaceByName(String name) {
    return _races.firstWhere(
      (race) => race.getName() == name,
      orElse: () => throw SettlementTypeNotFoundException(
          "Race with name $name was not found"),
    );
  }

  /// Adds [race] to the list of all races and active races
  static void registerRace(Race race) {
    _races.add(race);
    _activeRaces.add(race);
  }

  /// Removes [race] only from the active races
  static void unregisterRace(Race race) {
    _activeRaces.remove(getRaceByName(race.getName()));
  }

  /// Removes [race] from the active races and from all races lists
  static void deleteRace(Race race) {
    final foundRace = getRaceByName(race.getName());
    _races.remove(foundRace);
    _activeRaces.remove(foundRace);
  }
}
