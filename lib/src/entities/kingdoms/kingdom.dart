import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/kingdoms/government_types/government_type.dart';
import '../../subtypes/kingdoms/government_types/government_type_manager.dart';
import '../../subtypes/kingdoms/kingdom_type.dart';
import '../../subtypes/kingdoms/kingdom_type_manager.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../emblems/emblem.dart';
import '../guilds/guilds.dart';
import '../npcs/npc.dart';
import '../settlements/settlement.dart';

class Kingdom {
  /// The name of the kingdom
  final String name;

  /// The type of the kingdom generation settings
  final KingdomType kingdomType;

  /// The rulers of the kingdom
  final List<Npc> rulers;

  /// The race of the kingdom
  final Race race;

  /// The population of the kingdom
  final int population;

  /// The capital of the kingdom
  final Settlement capital;

  /// Some important settlements in the kingdom
  final List<Settlement> importantSettlements;

  /// The government type of the kingdom
  final GovernmentType governmentType;

  final Emblem emblem;

  /// Something this kingdom is known for
  final String knownFor;

  /// The history of the kingdom
  final String history;

  /// List of guilds that operate in this kingdom
  final List<Guild> guilds;

  // A trouble this kingdom have
  final String trouble;
  Kingdom({
    required this.name,
    required this.kingdomType,
    required this.rulers,
    required this.race,
    required this.population,
    required this.capital,
    required this.importantSettlements,
    required this.governmentType,
    required this.emblem,
    required this.knownFor,
    required this.history,
    required this.guilds,
    required this.trouble,
  });

  Kingdom copyWith({
    String? name,
    KingdomType? kingdomType,
    List<Npc>? rulers,
    Race? race,
    int? population,
    Settlement? capital,
    List<Settlement>? importantSettlements,
    GovernmentType? governmentType,
    Emblem? emblem,
    String? knownFor,
    String? history,
    List<Guild>? guilds,
    String? trouble,
  }) {
    return Kingdom(
      name: name ?? this.name,
      kingdomType: kingdomType ?? this.kingdomType,
      rulers: rulers ?? this.rulers,
      race: race ?? this.race,
      population: population ?? this.population,
      capital: capital ?? this.capital,
      importantSettlements: importantSettlements ?? this.importantSettlements,
      governmentType: governmentType ?? this.governmentType,
      emblem: emblem ?? this.emblem,
      knownFor: knownFor ?? this.knownFor,
      history: history ?? this.history,
      guilds: guilds ?? this.guilds,
      trouble: trouble ?? this.trouble,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'kingdomType': kingdomType.getKingdomType(),
      'rulers': rulers.map((x) => x.toMap()).toList(),
      'race': race.getName(),
      'population': population,
      'capital': capital.toMap(),
      'importantSettlements':
          importantSettlements.map((x) => x.toMap()).toList(),
      'governmentType': governmentType.getGovernmentType(),
      'emblem': emblem.toMap(),
      'knownFor': knownFor,
      'history': history,
      'guilds': guilds.map((x) => x.toMap()).toList(),
      'trouble': trouble,
    };
  }

  factory Kingdom.fromMap(Map<String, dynamic> map) {
    return Kingdom(
      name: map['name'],
      kingdomType: KingdomTypeManager.getKingdomTypeByType(map['kingdomType']),
      rulers: List<Npc>.from(
        (map['rulers']).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
      race: RaceManager.getRaceByName(map['race']),
      population: map['population'],
      capital: Settlement.fromMap(map['capital']),
      importantSettlements: List<Settlement>.from(
        (map['importantSettlements']).map<Settlement>(
          (x) => Settlement.fromMap(x),
        ),
      ),
      governmentType:
          GovernmentTypeManager.getGovernmentTypeByType(map['governmentType']),
      emblem: Emblem.fromMap(map['emblem']),
      knownFor: map['knownFor'],
      history: map['history'],
      guilds: List<Guild>.from(
        (map['guilds']).map<Guild>(
          (x) => Guild.fromMap(x),
        ),
      ),
      trouble: map['trouble'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Kingdom.fromJson(String source) =>
      Kingdom.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Kingdom(name: $name, kingdomType: $kingdomType, rulers: $rulers, race: $race, population: $population, capital: $capital, importantSettlements: $importantSettlements, governmentType: $governmentType, emblem: $emblem, knownFor: $knownFor, history: $history, guilds: $guilds, trouble: $trouble)';
  }

  @override
  bool operator ==(covariant Kingdom other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.kingdomType == kingdomType &&
        listEquals(other.rulers, rulers) &&
        other.race == race &&
        other.population == population &&
        other.capital == capital &&
        listEquals(other.importantSettlements, importantSettlements) &&
        other.governmentType == governmentType &&
        other.emblem == emblem &&
        other.knownFor == knownFor &&
        other.history == history &&
        listEquals(other.guilds, guilds) &&
        other.trouble == trouble;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        kingdomType.hashCode ^
        rulers.hashCode ^
        race.hashCode ^
        population.hashCode ^
        capital.hashCode ^
        importantSettlements.hashCode ^
        governmentType.hashCode ^
        emblem.hashCode ^
        knownFor.hashCode ^
        history.hashCode ^
        guilds.hashCode ^
        trouble.hashCode;
  }
}
