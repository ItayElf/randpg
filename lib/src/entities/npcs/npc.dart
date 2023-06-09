import 'dart:convert';

import '../../enums/gender.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import 'personality.dart';
import 'physical_description.dart';

/// A class that represents the npc entity
class Npc {
  /// The name of the npc
  final String name;

  /// The age of the npc
  final int age;

  /// The gender of the npc
  final Gender gender;

  /// The race of the npc
  final Race race;

  /// The occupation of the npc
  final String occupation;

  /// The physical description of the npc
  final PhysicalDescription physicalDescription;

  /// The personality of the npc
  final Personality personality;

  /// The goal of the npc
  final String goal;

  const Npc({
    required this.name,
    required this.age,
    required this.gender,
    required this.race,
    required this.occupation,
    required this.physicalDescription,
    required this.personality,
    required this.goal,
  });

  Npc copyWith({
    String? name,
    int? age,
    Gender? gender,
    Race? race,
    String? occupation,
    PhysicalDescription? physicalDescription,
    Personality? personality,
    String? goal,
  }) {
    return Npc(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      race: race ?? this.race,
      occupation: occupation ?? this.occupation,
      physicalDescription: physicalDescription ?? this.physicalDescription,
      personality: personality ?? this.personality,
      goal: goal ?? this.goal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'gender': gender.name,
      'race': race.getName(),
      'occupation': occupation,
      'physicalDescription': physicalDescription.toMap(),
      'personality': personality.toMap(),
      'goal': goal,
    };
  }

  factory Npc.fromMap(Map<String, dynamic> map) {
    return Npc(
      name: map['name'],
      age: map['age'],
      gender: Gender.values.byName(map['gender']),
      race: RaceManager.getRaceByName(map['race']),
      occupation: map['occupation'],
      physicalDescription:
          PhysicalDescription.fromMap(map['physicalDescription']),
      personality: Personality.fromMap(map['personality']),
      goal: map['goal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Npc.fromJson(String source) =>
      Npc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Npc(name: $name, age: $age, gender: $gender, race: $race, occupation: $occupation, physicalDescription: $physicalDescription, personality: $personality, goal: $goal)';
  }

  @override
  bool operator ==(covariant Npc other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        other.gender == gender &&
        other.race == race &&
        other.occupation == occupation &&
        other.physicalDescription == physicalDescription &&
        other.personality == personality &&
        other.goal == goal;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        race.hashCode ^
        occupation.hashCode ^
        physicalDescription.hashCode ^
        personality.hashCode ^
        goal.hashCode;
  }
}
