import 'dart:convert';

import 'package:collection/collection.dart';

import 'alignment.dart';

class Personality {
  final Alignment alignment;
  final List<String> traits;
  final List<String> quirks;

  const Personality({
    required this.alignment,
    required this.traits,
    required this.quirks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alignment': alignment.toMap(),
      'traits': traits,
      'quirks': quirks,
    };
  }

  factory Personality.fromMap(Map<String, dynamic> map) {
    return Personality(
      alignment: Alignment.fromMap(map['alignment'] as Map<String, dynamic>),
      traits: List<String>.from((map['traits'] as List<String>)),
      quirks: List<String>.from((map['quirks'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Personality.fromJson(String source) =>
      Personality.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Personality(alignment: $alignment, traits: $traits, quirks: $quirks)';

  @override
  bool operator ==(covariant Personality other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.alignment == alignment &&
        listEquals(other.traits, traits) &&
        listEquals(other.quirks, quirks);
  }

  @override
  int get hashCode => alignment.hashCode ^ traits.hashCode ^ quirks.hashCode;
}
