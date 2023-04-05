import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../../subtypes/settlements/settlement_type.dart';
import '../../subtypes/settlements/settlements_manager.dart';
import '../npcs/npc.dart';
import 'location.dart';

/// A class that represent a settlement
class Settlement {
  /// The name of the settlement
  final String name;

  /// The type of the settlement
  final SettlementType settlementType;

  /// The dominant race in the settlement (null if there is no dominant race)
  final Race? dominantRace;

  /// Important locations in the settlement
  final List<Location> locations;

  /// A description of the settlement
  final String description;

  /// The dominant occupation of the citizens (if there is)
  final String? dominantOccupation;

  /// Important characters in the settlements
  final List<Npc> importantCharacters;

  /// The population of the settlement
  final int population;

  /// A trouble this settlement is facing
  final String trouble;

  const Settlement({
    required this.name,
    required this.settlementType,
    this.dominantRace,
    required this.locations,
    required this.description,
    this.dominantOccupation,
    required this.importantCharacters,
    required this.population,
    required this.trouble,
  });

  Settlement copyWith({
    String? name,
    SettlementType? settlementType,
    Race? dominantRace,
    List<Location>? locations,
    String? description,
    String? dominantOccupation,
    List<Npc>? importantCharacters,
    int? population,
    String? trouble,
  }) {
    return Settlement(
      name: name ?? this.name,
      settlementType: settlementType ?? this.settlementType,
      dominantRace: dominantRace ?? this.dominantRace,
      locations: locations ?? this.locations,
      description: description ?? this.description,
      dominantOccupation: dominantOccupation ?? this.dominantOccupation,
      importantCharacters: importantCharacters ?? this.importantCharacters,
      population: population ?? this.population,
      trouble: trouble ?? this.trouble,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'settlementType': settlementType.getSettlementType(),
      'dominantRace': dominantRace?.getName(),
      'locations': locations.map((x) => x.toMap()).toList(),
      'description': description,
      'dominantOccupation': dominantOccupation,
      'importantCharacters': importantCharacters.map((x) => x.toMap()).toList(),
      'population': population,
      'trouble': trouble,
    };
  }

  factory Settlement.fromMap(Map<String, dynamic> map) {
    return Settlement(
      name: map['name'] as String,
      settlementType:
          SettlementManager.getSettlementTypeByType(map['settlementType']),
      dominantRace: map['dominantRace'] != null
          ? RaceManager.getRaceByName(map['dominantRace'])
          : null,
      locations: List<Location>.from(
        (map['locations'] as List<Map<String, dynamic>>).map<Location>(
          (x) => Location.fromMap(x),
        ),
      ),
      description: map['description'] as String,
      dominantOccupation: map['dominantOccupation'] != null
          ? map['dominantOccupation'] as String
          : null,
      importantCharacters: List<Npc>.from(
        (map['importantCharacters'] as List<Map<String, dynamic>>).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
      population: map['population'] as int,
      trouble: map['trouble'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settlement.fromJson(String source) =>
      Settlement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Settlement(name: $name, settlementType: $settlementType, dominantRace: $dominantRace, locations: $locations, description: $description, dominantOccupation: $dominantOccupation, importantCharacters: $importantCharacters, population: $population, trouble: $trouble)';
  }

  @override
  bool operator ==(covariant Settlement other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.settlementType == settlementType &&
        other.dominantRace == dominantRace &&
        listEquals(other.locations, locations) &&
        other.description == description &&
        other.dominantOccupation == dominantOccupation &&
        listEquals(other.importantCharacters, importantCharacters) &&
        other.population == population &&
        other.trouble == trouble;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        settlementType.hashCode ^
        dominantRace.hashCode ^
        locations.hashCode ^
        description.hashCode ^
        dominantOccupation.hashCode ^
        importantCharacters.hashCode ^
        population.hashCode ^
        trouble.hashCode;
  }
}
