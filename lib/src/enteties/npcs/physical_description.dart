import 'dart:convert';

import 'package:collection/collection.dart';

/// A class that represents the physical description of an npc
class PhysicalDescription {
  /// The hair style of this npc. For some races it might be head shape or something else
  final String hairStyle;

  /// The eye color of this npc
  final String eyes;

  // The skin color of this npc
  final String skin;

  /// The height of this npc in centimeters
  final int height;

  /// The physical build of this npc (musular, lean, etc.)
  final String build;

  /// The face of this npc
  final String face;

  /// List of special features this npc has
  final List<String> specialFeatures;

  const PhysicalDescription({
    required this.hairStyle,
    required this.eyes,
    required this.skin,
    required this.height,
    required this.build,
    required this.face,
    required this.specialFeatures,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hairStyle': hairStyle,
      'eyes': eyes,
      'skin': skin,
      'height': height,
      'build': build,
      'face': face,
      'specialFeatures': specialFeatures,
    };
  }

  factory PhysicalDescription.fromMap(Map<String, dynamic> map) {
    return PhysicalDescription(
      hairStyle: map['hairStyle'] as String,
      eyes: map['eyes'] as String,
      skin: map['skin'] as String,
      height: map['height'] as int,
      build: map['build'] as String,
      face: map['face'] as String,
      specialFeatures: List<String>.from(
        (map['specialFeatures'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalDescription.fromJson(String source) =>
      PhysicalDescription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhysicalDescription(hairStyle: $hairStyle, eyes: $eyes, skin: $skin, height: $height, build: $build, face: $face, specialFeatures: $specialFeatures)';
  }

  @override
  bool operator ==(covariant PhysicalDescription other) {
    if (identical(this, other)) return true;
    final listEquals = DeepCollectionEquality().equals;

    return other.hairStyle == hairStyle &&
        other.eyes == eyes &&
        other.skin == skin &&
        other.height == height &&
        other.build == build &&
        other.face == face &&
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
        specialFeatures.hashCode;
  }
}
