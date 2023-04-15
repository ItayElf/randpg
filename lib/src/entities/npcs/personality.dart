import 'dart:convert';

import 'package:collection/collection.dart';

import 'alignment.dart';

/// A class that represents a personality of an npc
class Personality {
  /// The alignment of the npc
  final Alignment alignment;

  /// A list of personality traits the npc has
  final List<String> traits;

  /// A list of personality quirks the npc has
  final List<String> quirks;

  /// A list of adjectives that described the npc
  final List<String> descriptors;

  const Personality({
    required this.alignment,
    required this.traits,
    required this.quirks,
    required this.descriptors,
  });

  Personality copyWith({
    Alignment? alignment,
    List<String>? traits,
    List<String>? quirks,
    List<String>? descriptors,
  }) {
    return Personality(
      alignment: alignment ?? this.alignment,
      traits: traits ?? this.traits,
      quirks: quirks ?? this.quirks,
      descriptors: descriptors ?? this.descriptors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alignment': alignment.toMap(),
      'traits': traits,
      'quirks': quirks,
      'descriptors': descriptors,
    };
  }

  factory Personality.fromMap(Map<String, dynamic> map) {
    return Personality(
      alignment: Alignment.fromMap(map['alignment'] as Map<String, dynamic>),
      traits: List<String>.from((map['traits'] as List<String>)),
      quirks: List<String>.from((map['quirks'] as List<String>)),
      descriptors: List<String>.from(
        (map['descriptors'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Personality.fromJson(String source) =>
      Personality.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Personality(alignment: $alignment, traits: $traits, quirks: $quirks, descriptors: $descriptors)';
  }

  @override
  bool operator ==(covariant Personality other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.alignment == alignment &&
        listEquals(other.traits, traits) &&
        listEquals(other.quirks, quirks) &&
        listEquals(other.descriptors, descriptors);
  }

  @override
  int get hashCode {
    return alignment.hashCode ^
        traits.hashCode ^
        quirks.hashCode ^
        descriptors.hashCode;
  }
}
