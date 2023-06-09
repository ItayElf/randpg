import 'dart:convert';

import 'package:collection/collection.dart';

import 'hair.dart';

/// A class that represents the physical description of an npc
class PhysicalDescription {
  /// The hair style of this npc. For some races it might be head shape or something else
  final Hair hairStyle;

  /// The eye color of this npc
  final String eyes;

  // The skin color of this npc
  final String skin;

  /// The height of this npc in centimeters
  final int height;

  /// The physical build of this npc (muscular, lean, etc.)
  final String build;

  /// The face of this npc
  final String face;

  /// The beard of this npc (if has)
  final Hair? beard;

  /// List of special features this npc has
  final List<String> specialFeatures;

  const PhysicalDescription({
    required this.hairStyle,
    required this.eyes,
    required this.skin,
    required this.height,
    required this.build,
    required this.face,
    this.beard,
    required this.specialFeatures,
  });

  PhysicalDescription copyWith({
    Hair? hairStyle,
    String? eyes,
    String? skin,
    int? height,
    String? build,
    String? face,
    Hair? beard,
    List<String>? specialFeatures,
  }) {
    return PhysicalDescription(
      hairStyle: hairStyle ?? this.hairStyle,
      eyes: eyes ?? this.eyes,
      skin: skin ?? this.skin,
      height: height ?? this.height,
      build: build ?? this.build,
      face: face ?? this.face,
      beard: beard ?? this.beard,
      specialFeatures: specialFeatures ?? this.specialFeatures,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hairStyle': hairStyle.toMap(),
      'eyes': eyes,
      'skin': skin,
      'height': height,
      'build': build,
      'face': face,
      'beard': beard?.toMap(),
      'specialFeatures': specialFeatures,
    };
  }

  factory PhysicalDescription.fromMap(Map<String, dynamic> map) {
    return PhysicalDescription(
      hairStyle: Hair.fromMap(map['hairStyle']),
      eyes: map['eyes'],
      skin: map['skin'],
      height: map['height'],
      build: map['build'],
      face: map['face'],
      beard: map['beard'] != null ? Hair.fromMap(map['beard']) : null,
      specialFeatures: List<String>.from(
        (map['specialFeatures']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalDescription.fromJson(String source) =>
      PhysicalDescription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhysicalDescription(hairStyle: $hairStyle, eyes: $eyes, skin: $skin, height: $height, build: $build, face: $face, beard: $beard, specialFeatures: $specialFeatures)';
  }

  @override
  bool operator ==(covariant PhysicalDescription other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.hairStyle == hairStyle &&
        other.eyes == eyes &&
        other.skin == skin &&
        other.height == height &&
        other.build == build &&
        other.face == face &&
        other.beard == beard &&
        listEquals(other.specialFeatures, specialFeatures);
  }

  @override
  int get hashCode {
    return hairStyle.hashCode ^
        eyes.hashCode ^
        skin.hashCode ^
        height.hashCode ^
        build.hashCode ^
        face.hashCode ^
        beard.hashCode ^
        specialFeatures.hashCode;
  }
}
