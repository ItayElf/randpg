// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/government_types/govenrment_type_manager.dart';

import '../../subtypes/government_types/government_type.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../guilds/guilds.dart';
import '../npcs/npc.dart';
import '../settlements/settlement.dart';

class Kingdom {
  /// The name of the kingdom
  final String name;

  /// The ruler of the kingdom
  final Npc ruler;

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

  /// Something this kingdom is known for
  final String knownFor;

  /// The history of the kingdom
  final String history;

  /// List of guilds that operate in this kingdom
  final List<Guild> guilds;

  // A trouble this kingdom have
  final String trouble;

  const Kingdom({
    required this.name,
    required this.ruler,
    required this.race,
    required this.population,
    required this.capital,
    required this.importantSettlements,
    required this.governmentType,
    required this.knownFor,
    required this.history,
    required this.guilds,
    required this.trouble,
  });

  Kingdom copyWith({
    String? name,
    Npc? ruler,
    Race? race,
    int? population,
    Settlement? capital,
    List<Settlement>? importantSettlements,
    GovernmentType? governmentType,
    String? knownFor,
    String? history,
    List<Guild>? guilds,
    String? trouble,
  }) {
    return Kingdom(
      name: name ?? this.name,
      ruler: ruler ?? this.ruler,
      race: race ?? this.race,
      population: population ?? this.population,
      capital: capital ?? this.capital,
      importantSettlements: importantSettlements ?? this.importantSettlements,
      governmentType: governmentType ?? this.governmentType,
      knownFor: knownFor ?? this.knownFor,
      history: history ?? this.history,
      guilds: guilds ?? this.guilds,
      trouble: trouble ?? this.trouble,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ruler': ruler.toMap(),
      'race': race.getName(),
      'population': population,
      'capital': capital.toMap(),
      'importantSettlements':
          importantSettlements.map((x) => x.toMap()).toList(),
      'governmentType': governmentType.getGovernmentType(),
      'knownFor': knownFor,
      'history': history,
      'guilds': guilds.map((x) => x.toMap()).toList(),
      'trouble': trouble,
    };
  }

  factory Kingdom.fromMap(Map<String, dynamic> map) {
    return Kingdom(
      name: map['name'] as String,
      ruler: Npc.fromMap(map['ruler'] as Map<String, dynamic>),
      race: RaceManager.getRaceByName(map['race']),
      population: map['population'] as int,
      capital: Settlement.fromMap(map['capital'] as Map<String, dynamic>),
      importantSettlements: List<Settlement>.from(
        (map['importantSettlements'] as List<Map<String, dynamic>>)
            .map<Settlement>(
          (x) => Settlement.fromMap(x),
        ),
      ),
      governmentType:
          GovernmentTypeManager.getGovernmentTypeByType(map['governmentType']),
      knownFor: map['knownFor'] as String,
      history: map['history'] as String,
      guilds: List<Guild>.from(
        (map['guilds'] as List<Map<String, dynamic>>).map<Guild>(
          (x) => Guild.fromMap(x),
        ),
      ),
      trouble: map['trouble'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kingdom.fromJson(String source) =>
      Kingdom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kingdom(name: $name, ruler: $ruler, race: $race, population: $population, capital: $capital, importantSettlements: $importantSettlements, governmentType: $governmentType, knownFor: $knownFor, history: $history, guilds: $guilds, trouble: $trouble)';
  }

  @override
  bool operator ==(covariant Kingdom other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.ruler == ruler &&
        other.race == race &&
        other.population == population &&
        other.capital == capital &&
        listEquals(other.importantSettlements, importantSettlements) &&
        other.governmentType == governmentType &&
        other.knownFor == knownFor &&
        other.history == history &&
        listEquals(other.guilds, guilds) &&
        other.trouble == trouble;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        ruler.hashCode ^
        race.hashCode ^
        population.hashCode ^
        capital.hashCode ^
        importantSettlements.hashCode ^
        governmentType.hashCode ^
        knownFor.hashCode ^
        history.hashCode ^
        guilds.hashCode ^
        trouble.hashCode;
  }
}