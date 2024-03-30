import 'dart:convert';

import 'package:collection/collection.dart';

import '../../enums/gender.dart';
import '../../subtypes/companions/companion_manager.dart';
import '../../subtypes/companions/companion_type.dart';

/// A class that represents a companion or a familiar
class Companion {
  /// The name of the companion
  final String name;

  /// The gender of the companion
  final Gender gender;

  /// The companion type
  final CompanionType companionType;

  /// The appearance of the companion
  final String appearance;

  /// The personality of the companion
  final String personality;

  /// The skills of the companion
  final List<String> skills;

  /// The quirks the companion has
  final List<String> quirks;

  const Companion({
    required this.name,
    required this.gender,
    required this.companionType,
    required this.appearance,
    required this.personality,
    required this.skills,
    required this.quirks,
  });

  Companion copyWith({
    String? name,
    Gender? gender,
    CompanionType? companionType,
    String? appearance,
    String? personality,
    List<String>? skills,
    List<String>? quirks,
  }) {
    return Companion(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      companionType: companionType ?? this.companionType,
      appearance: appearance ?? this.appearance,
      personality: personality ?? this.personality,
      skills: skills ?? this.skills,
      quirks: quirks ?? this.quirks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender.name,
      'companionType': companionType.getCompanionType(),
      'appearance': appearance,
      'personality': personality,
      'skills': skills,
      'quirks': quirks,
    };
  }

  factory Companion.fromMap(Map<String, dynamic> map) {
    return Companion(
      name: map['name'] as String,
      gender: Gender.values.byName(map['gender']),
      companionType: CompanionManager().getType(map["companionType"]),
      appearance: map['appearance'] as String,
      personality: map['personality'] as String,
      skills: List<String>.from(map['skills']),
      quirks: List<String>.from(map['quirks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Companion.fromJson(String source) =>
      Companion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Companion(name: $name, gender: $gender, companionType: $companionType, appearance: $appearance, personality: $personality, skills: $skills, quirks: $quirks)';
  }

  @override
  bool operator ==(covariant Companion other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.gender == gender &&
        other.companionType == companionType &&
        other.appearance == appearance &&
        other.personality == personality &&
        listEquals(other.skills, skills) &&
        listEquals(other.quirks, quirks);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        gender.hashCode ^
        companionType.hashCode ^
        appearance.hashCode ^
        personality.hashCode ^
        skills.hashCode ^
        quirks.hashCode;
  }
}
