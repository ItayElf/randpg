// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'hsl_color.dart';
import 'icon_position.dart';
import 'svg_wrapper.dart';

/// A class that represents an emblem in svg
class Emblem {
  /// The svg of the shape of the emblem
  final SvgWrapper shape;

  /// The pattern of the emblem
  final SvgWrapper pattern;

  /// A map between icons on the emblem and their positions
  final Map<SvgWrapper, IconPosition> iconsToPositions;

  /// The primary color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor primaryColor;

  /// The secondary color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor secondaryColor;

  /// The icons color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor iconsColor;

  /// The template for the emblem svg
  static const _emblemTemplate =
      """<svg width="120.25" height="150" viewBox="0 0 120.25 150" fill="none" xmlns="http://www.w3.org/2000/svg"><g>
      <mask id="b" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0">{{SHAPE}}</mask><g mask="url(#b)">
      {{PATTERN}}</g>{{ICONS}}</g></svg>""";

  static const _shapeToken = "{{SHAPE}}";
  static const _patternToken = "{{PATTERN}}";
  static const _iconsToken = "{{ICONS}}";

  static const _baseIconsColor = "red";
  static const _basePrimaryColor = "#000";
  static const _baseSecondaryColor = "#fff";

  const Emblem({
    required this.shape,
    required this.pattern,
    required this.iconsToPositions,
    required this.primaryColor,
    required this.secondaryColor,
    required this.iconsColor,
  });

  /// Builds an svg from the emblem data
  String buildSvg() {
    String shapeSvg = shape.content;
    String patternSvg = pattern.recolored({
      _basePrimaryColor: primaryColor.toString(),
      _baseSecondaryColor: secondaryColor.toString(),
    }).content;
    String icons = _getIconsSvg();

    return _emblemTemplate
        .replaceAll(_shapeToken, shapeSvg)
        .replaceAll(_patternToken, patternSvg)
        .replaceAll(_iconsToken, icons)
        .replaceAll("\n", "")
        .replaceAll(RegExp(" +"), " ");
  }

  /// Returns the svg of the icons according to their positions
  String _getIconsSvg() {
    String icons = "";

    for (final iconPair in iconsToPositions.entries) {
      final position = iconPair.value;
      final iconWrapper = iconPair.key;

      icons += iconWrapper
          .resized(width: position.size, height: position.size)
          .recolored({_baseIconsColor: iconsColor.toString()})
          .positioned(x: position.x, y: position.y)
          .content;
    }

    return icons;
  }

  Emblem copyWith({
    SvgWrapper? shape,
    SvgWrapper? pattern,
    Map<SvgWrapper, IconPosition>? iconsToPositions,
    HslColor? primaryColor,
    HslColor? secondaryColor,
    HslColor? iconsColor,
  }) {
    return Emblem(
      shape: shape ?? this.shape,
      pattern: pattern ?? this.pattern,
      iconsToPositions: iconsToPositions ?? this.iconsToPositions,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      iconsColor: iconsColor ?? this.iconsColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shape': shape.toMap(),
      'pattern': pattern.toMap(),
      'iconsToPositions': iconsToPositions,
      'primaryColor': primaryColor.toMap(),
      'secondaryColor': secondaryColor.toMap(),
      'iconsColor': iconsColor.toMap(),
    };
  }

  factory Emblem.fromMap(Map<String, dynamic> map) {
    return Emblem(
      shape: SvgWrapper.fromMap(map['shape'] as Map<String, dynamic>),
      pattern: SvgWrapper.fromMap(map['pattern'] as Map<String, dynamic>),
      iconsToPositions: Map<SvgWrapper, IconPosition>.from(
        (map['iconsToPositions'] as Map<String, String>).map(
          (key, value) =>
              MapEntry(SvgWrapper.fromJson(key), IconPosition.fromJson(value)),
        ),
      ),
      primaryColor:
          HslColor.fromMap(map['primaryColor'] as Map<String, dynamic>),
      secondaryColor:
          HslColor.fromMap(map['secondaryColor'] as Map<String, dynamic>),
      iconsColor: HslColor.fromMap(map['iconsColor'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Emblem.fromJson(String source) =>
      Emblem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Emblem(shape: $shape, pattern: $pattern, iconsToPositions: $iconsToPositions, primaryColor: $primaryColor, secondaryColor: $secondaryColor, iconsColor: $iconsColor)';
  }

  @override
  bool operator ==(covariant Emblem other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.shape == shape &&
        other.pattern == pattern &&
        mapEquals(other.iconsToPositions, iconsToPositions) &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.iconsColor == iconsColor;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        pattern.hashCode ^
        iconsToPositions.hashCode ^
        primaryColor.hashCode ^
        secondaryColor.hashCode ^
        iconsColor.hashCode;
  }
}
