import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/races/race_manager.dart';

import '../../subtypes/races/race.dart';
import '../../subtypes/worlds/world_settings.dart';
import '../../subtypes/worlds/world_settings_manager.dart';
import '../deities/deity.dart';
import '../landscapes/landscape.dart';
import '../npcs/npc.dart';
import '../settlements/settlement.dart';
import 'world_lore.dart';

/// A class that represents a world
class World {
  /// The name of the world
  final String name;

  /// The settings of the generated world
  final WorldSettings worldSettings;

  /// Notable settlements in the world
  final List<Settlement> settlements;

  /// Notable landscapes in the world
  final List<Landscape> landscapes;

  /// Opinions of the other races on each race
  final Map<Race, String> opinions;

  /// Notable characters in the world
  final List<Npc> importantPeople;

  /// The deities of the world
  final List<Deity> deities;

  /// Lesser deities of the world
  final List<Deity> lesserDeities;

  /// Higher deities of the world
  final List<Deity> higherDeities;

  /// The lore of the world
  final WorldLore worldLore;

  const World({
    required this.name,
    required this.worldSettings,
    required this.settlements,
    required this.landscapes,
    required this.opinions,
    required this.importantPeople,
    required this.deities,
    required this.lesserDeities,
    required this.higherDeities,
    required this.worldLore,
  });

  World copyWith({
    String? name,
    WorldSettings? worldSettings,
    List<Settlement>? settlements,
    List<Landscape>? landscapes,
    Map<Race, String>? opinions,
    List<Npc>? importantPeople,
    List<Deity>? deities,
    List<Deity>? lesserDeities,
    List<Deity>? higherDeities,
    WorldLore? worldLore,
  }) {
    return World(
      name: name ?? this.name,
      worldSettings: worldSettings ?? this.worldSettings,
      settlements: settlements ?? this.settlements,
      landscapes: landscapes ?? this.landscapes,
      opinions: opinions ?? this.opinions,
      importantPeople: importantPeople ?? this.importantPeople,
      deities: deities ?? this.deities,
      lesserDeities: lesserDeities ?? this.lesserDeities,
      higherDeities: higherDeities ?? this.higherDeities,
      worldLore: worldLore ?? this.worldLore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'worldSettings': worldSettings.getSettingName(),
      'settlements': settlements.map((x) => x.toMap()).toList(),
      'landscapes': landscapes.map((x) => x.toMap()).toList(),
      'opinions': opinions.map((key, value) => MapEntry(key.getName(), value)),
      'importantPeople': importantPeople.map((x) => x.toMap()).toList(),
      'deities': deities.map((x) => x.toMap()).toList(),
      'lesserDeities': lesserDeities.map((x) => x.toMap()).toList(),
      'higherDeities': higherDeities.map((x) => x.toMap()).toList(),
      'worldLore': worldLore.toMap(),
    };
  }

  factory World.fromMap(Map<String, dynamic> map) {
    return World(
      name: map['name'] as String,
      worldSettings:
          WorldSettingsManager.getWorldSettingsByName(map['worldSettings']),
      settlements: List<Settlement>.from(
        (map['settlements'] as List<Map<String, dynamic>>).map<Settlement>(
          (x) => Settlement.fromMap(x),
        ),
      ),
      landscapes: List<Landscape>.from(
        (map['landscapes'] as List<Map<String, dynamic>>).map<Landscape>(
          (x) => Landscape.fromMap(x),
        ),
      ),
      opinions: (map['opinions'] as Map<String, String>).map(
        (key, value) => MapEntry(RaceManager.getRaceByName(key), value),
      ),
      importantPeople: List<Npc>.from(
        (map['importantPeople'] as List<Map<String, dynamic>>).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
      deities: List<Deity>.from(
        (map['deities'] as List<Map<String, dynamic>>).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      lesserDeities: List<Deity>.from(
        (map['lesserDeities'] as List<Map<String, dynamic>>).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      higherDeities: List<Deity>.from(
        (map['higherDeities'] as List<Map<String, dynamic>>).map<Deity>(
          (x) => Deity.fromMap(x),
        ),
      ),
      worldLore: WorldLore.fromMap(map['worldLore'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory World.fromJson(String source) =>
      World.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'World(name: $name, worldSettings: $worldSettings, settlements: $settlements, landscapes: $landscapes, opinions: $opinions, importantPeople: $importantPeople, deities: $deities, lesserDeities: $lesserDeities, higherDeities: $higherDeities, worldLore: $worldLore)';
  }

  @override
  bool operator ==(covariant World other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.worldSettings == worldSettings &&
        collectionEquals(other.settlements, settlements) &&
        collectionEquals(other.landscapes, landscapes) &&
        collectionEquals(other.opinions, opinions) &&
        collectionEquals(other.importantPeople, importantPeople) &&
        collectionEquals(other.deities, deities) &&
        collectionEquals(other.lesserDeities, lesserDeities) &&
        collectionEquals(other.higherDeities, higherDeities) &&
        other.worldLore == worldLore;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        worldSettings.hashCode ^
        settlements.hashCode ^
        landscapes.hashCode ^
        opinions.hashCode ^
        importantPeople.hashCode ^
        deities.hashCode ^
        lesserDeities.hashCode ^
        higherDeities.hashCode ^
        worldLore.hashCode;
  }
}
