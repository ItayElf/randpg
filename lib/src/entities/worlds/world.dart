import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../../subtypes/worlds/world_settings.dart';
import '../../subtypes/worlds/world_settings_manager.dart';
import '../deities/deity.dart';
import '../guilds/guilds.dart';
import '../holidays/holiday.dart';
import '../kingdoms/kingdom.dart';
import '../landscapes/landscape.dart';
import '../npcs/npc.dart';
import '../world_map/world_map.dart';
import 'world_lore.dart';

/// A class that represents a world
class World {
  /// The name of the world
  final String name;

  /// The settings of the generated world
  final WorldSettings worldSettings;

  /// List of kingdoms in this world
  final List<Kingdom> kingdoms;

  /// Notable landscapes in the world
  final List<Landscape> landscapes;

  /// Opinions of the other races on each race
  final Map<Race, String> opinions;

  /// Notable characters in the world
  final List<Npc> importantPeople;

  /// Guilds that work in a worldwide scale in this world
  final List<Guild> guilds;

  /// The deities of the world
  final List<Deity> deities;

  /// Lesser deities of the world
  final List<Deity> lesserDeities;

  /// Higher deities of the world
  final List<Deity> higherDeities;

  /// The lore of the world
  final WorldLore worldLore;

  /// The holidays that exist in the world
  final List<Holiday> holidays;

  /// The map of the world
  final WorldMap worldMap;

  const World({
    required this.name,
    required this.worldSettings,
    required this.kingdoms,
    required this.landscapes,
    required this.opinions,
    required this.importantPeople,
    required this.guilds,
    required this.deities,
    required this.lesserDeities,
    required this.higherDeities,
    required this.worldLore,
    required this.holidays,
    required this.worldMap,
  });

  World copyWith({
    String? name,
    WorldSettings? worldSettings,
    List<Kingdom>? kingdoms,
    List<Landscape>? landscapes,
    Map<Race, String>? opinions,
    List<Npc>? importantPeople,
    List<Guild>? guilds,
    List<Deity>? deities,
    List<Deity>? lesserDeities,
    List<Deity>? higherDeities,
    WorldLore? worldLore,
    List<Holiday>? holidays,
    WorldMap? worldMap,
  }) {
    return World(
      name: name ?? this.name,
      worldSettings: worldSettings ?? this.worldSettings,
      kingdoms: kingdoms ?? this.kingdoms,
      landscapes: landscapes ?? this.landscapes,
      opinions: opinions ?? this.opinions,
      importantPeople: importantPeople ?? this.importantPeople,
      guilds: guilds ?? this.guilds,
      deities: deities ?? this.deities,
      lesserDeities: lesserDeities ?? this.lesserDeities,
      higherDeities: higherDeities ?? this.higherDeities,
      worldLore: worldLore ?? this.worldLore,
      holidays: holidays ?? this.holidays,
      worldMap: worldMap ?? this.worldMap,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'worldSettings': worldSettings.getSettingName(),
      'kingdoms': kingdoms.map((x) => x.toMap()).toList(),
      'landscapes': landscapes.map((x) => x.toMap()).toList(),
      'opinions': opinions.map((key, value) => MapEntry(key.getName(), value)),
      'importantPeople': importantPeople.map((x) => x.toMap()).toList(),
      'guilds': guilds.map((x) => x.toMap()).toList(),
      'deities': deities.map((x) => x.toMap()).toList(),
      'lesserDeities': lesserDeities.map((x) => x.toMap()).toList(),
      'higherDeities': higherDeities.map((x) => x.toMap()).toList(),
      'worldLore': worldLore.toMap(),
      'holidays': holidays.map((x) => x.toMap()).toList(),
      'worldMap': worldMap.toMap(),
    };
  }

  factory World.fromMap(Map<String, dynamic> map) {
    return World(
      name: map['name'],
      worldSettings: WorldSettingsManager().getType(map['worldSettings']),
      kingdoms: List<Kingdom>.from(
        (map['kingdoms']).map<Kingdom>(
          (x) => Kingdom.fromMap(x),
        ),
      ),
      landscapes: List<Landscape>.from(
        (map['landscapes']).map<Landscape>(
          (x) => Landscape.fromMap(x),
        ),
      ),
      opinions: (map['opinions'] as Map).map(
        (key, value) => MapEntry(RaceManager().getType(key), value),
      ),
      importantPeople: List<Npc>.from(
        (map['importantPeople']).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
      guilds: List<Guild>.from(
        (map['guilds']).map<Guild>(
          (x) => Guild.fromMap(x),
        ),
      ),
      deities: List<Deity>.from(
        (map['deities']).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      lesserDeities: List<Deity>.from(
        (map['lesserDeities']).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      higherDeities: List<Deity>.from(
        (map['higherDeities']).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      worldLore: WorldLore.fromMap(map['worldLore']),
      holidays: List<Holiday>.from(
        (map['holidays']).map<Holiday>(
          (x) => Holiday.fromMap(x),
        ),
      ),
      worldMap: WorldMap.fromMap(map["worldMap"]),
    );
  }

  factory World.fromShallowMap(Map<String, dynamic> map) {
    return World(
      name: map["name"],
      worldSettings: map["worldSettings"],
      kingdoms: map["kingdoms"],
      landscapes: map["landscapes"],
      opinions: map["opinions"],
      importantPeople: map["importantPeople"],
      guilds: map["guilds"],
      deities: map["deities"],
      lesserDeities: map["lesserDeities"],
      higherDeities: map["higherDeities"],
      worldLore: map["worldLore"],
      holidays: map["holidays"],
      worldMap: map["worldMap"],
    );
  }

  String toJson() => json.encode(toMap());

  factory World.fromJson(String source) => World.fromMap(json.decode(source));

  @override
  String toString() {
    return 'World(name: $name, worldSettings: $worldSettings, kingdoms: $kingdoms, landscapes: $landscapes, opinions: $opinions, importantPeople: $importantPeople, guilds: $guilds, deities: $deities, lesserDeities: $lesserDeities, higherDeities: $higherDeities, worldLore: $worldLore, holidays: $holidays, worldMap: $worldMap)';
  }

  @override
  bool operator ==(covariant World other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.worldSettings == worldSettings &&
        collectionEquals(other.kingdoms, kingdoms) &&
        collectionEquals(other.landscapes, landscapes) &&
        collectionEquals(other.opinions, opinions) &&
        collectionEquals(other.importantPeople, importantPeople) &&
        collectionEquals(other.guilds, guilds) &&
        collectionEquals(other.deities, deities) &&
        collectionEquals(other.lesserDeities, lesserDeities) &&
        collectionEquals(other.higherDeities, higherDeities) &&
        other.worldLore == worldLore &&
        collectionEquals(other.holidays, holidays) &&
        other.worldMap == worldMap;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        worldSettings.hashCode ^
        kingdoms.hashCode ^
        landscapes.hashCode ^
        opinions.hashCode ^
        importantPeople.hashCode ^
        guilds.hashCode ^
        deities.hashCode ^
        lesserDeities.hashCode ^
        higherDeities.hashCode ^
        worldLore.hashCode ^
        holidays.hashCode ^
        worldMap.hashCode;
  }
}
