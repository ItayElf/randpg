// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/emblems/emblem_type.dart';
import '../../subtypes/emblems/emblem_type_manager.dart';
import 'emblem_icon.dart';
import 'hsl_color.dart';
import 'svg_wrapper.dart';

/// A class that represents an emblem in svg
class Emblem {
  /// The svg of the shape of the emblem
  final SvgWrapper shape;

  /// The pattern of the emblem
  final SvgWrapper pattern;

  /// A map between icons on the emblem and their positions
  final List<EmblemIcon> icons;

  /// The primary color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor primaryColor;

  /// The secondary color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor secondaryColor;

  /// The icons color of the svg, in css valid format like "#12a43g" or "red"
  final HslColor iconsColor;

  /// The type of the emblem
  final EmblemType type;

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
    required this.icons,
    required this.primaryColor,
    required this.secondaryColor,
    required this.iconsColor,
    required this.type,
  });

  /// Builds an svg from the emblem data
  String buildSvg() {
    String shapeSvg = shape.content;
    String patternSvg = pattern.recolored({
      _basePrimaryColor: primaryColor.toString(),
      _baseSecondaryColor: secondaryColor.toString(),
    }).content;
    String iconsSvg = _getIconsSvg();

    return _emblemTemplate
        .replaceAll(_shapeToken, shapeSvg)
        .replaceAll(_patternToken, patternSvg)
        .replaceAll(_iconsToken, iconsSvg)
        .replaceAll("\n", "")
        .replaceAll(RegExp(" +"), " ");
  }

  /// Returns the svg of the icons according to their positions
  String _getIconsSvg() {
    String iconsSvg = "";

    for (final icon in icons) {
      final position = icon.position;
      final iconWrapper = icon.svgWrapper;

      iconsSvg += iconWrapper
          .resized(width: position.size, height: position.size)
          .recolored({_baseIconsColor: iconsColor.toString()})
          .positioned(x: position.x, y: position.y)
          .content;
    }

    return iconsSvg;
  }

  Emblem copyWith({
    SvgWrapper? shape,
    SvgWrapper? pattern,
    List<EmblemIcon>? icons,
    HslColor? primaryColor,
    HslColor? secondaryColor,
    HslColor? iconsColor,
    EmblemType? type,
  }) {
    return Emblem(
      shape: shape ?? this.shape,
      pattern: pattern ?? this.pattern,
      icons: icons ?? this.icons,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      iconsColor: iconsColor ?? this.iconsColor,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shape': shape.toMap(),
      'pattern': pattern.toMap(),
      'icons': icons.map((x) => x.toMap()).toList(),
      'primaryColor': primaryColor.toMap(),
      'secondaryColor': secondaryColor.toMap(),
      'iconsColor': iconsColor.toMap(),
      'type': type.getEmblemType(),
    };
  }

  factory Emblem.fromMap(Map<String, dynamic> map) {
    return Emblem(
      shape: SvgWrapper.fromMap(map['shape']),
      pattern: SvgWrapper.fromMap(map['pattern']),
      icons: List<EmblemIcon>.from(
        (map['icons']).map<EmblemIcon>(
          (x) => EmblemIcon.fromMap(x),
        ),
      ),
      primaryColor: HslColor.fromMap(map['primaryColor']),
      secondaryColor: HslColor.fromMap(map['secondaryColor']),
      iconsColor: HslColor.fromMap(map['iconsColor']),
      type: EmblemTypeManager.getEmblemTypeByType(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Emblem.fromJson(String source) =>
      Emblem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Emblem(shape: $shape, pattern: $pattern, icons: $icons, primaryColor: $primaryColor, secondaryColor: $secondaryColor, iconsColor: $iconsColor, type: $type)';
  }

  @override
  bool operator ==(covariant Emblem other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.shape == shape &&
        other.pattern == pattern &&
        listEquals(other.icons, icons) &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.iconsColor == iconsColor &&
        other.type == type;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        pattern.hashCode ^
        icons.hashCode ^
        primaryColor.hashCode ^
        secondaryColor.hashCode ^
        iconsColor.hashCode ^
        type.hashCode;
  }
}
