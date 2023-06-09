import 'dart:convert';

import 'icon_position.dart';
import 'svg_wrapper.dart';

/// A class that represents an icon in an emblem
class EmblemIcon {
  /// The svg wrapper that represents the icon
  final SvgWrapper svgWrapper;

  /// The position of the icon
  final IconPosition position;

  const EmblemIcon({
    required this.svgWrapper,
    required this.position,
  });

  EmblemIcon copyWith({
    SvgWrapper? svgWrapper,
    IconPosition? position,
  }) {
    return EmblemIcon(
      svgWrapper: svgWrapper ?? this.svgWrapper,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'svgWrapper': svgWrapper.toMap(),
      'position': position.toMap(),
    };
  }

  factory EmblemIcon.fromMap(Map<String, dynamic> map) {
    return EmblemIcon(
      svgWrapper: SvgWrapper.fromMap(map['svgWrapper']),
      position: IconPosition.fromMap(map['position']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmblemIcon.fromJson(String source) =>
      EmblemIcon.fromMap(json.decode(source));

  @override
  String toString() =>
      'EmblemIcon(svgWrapper: $svgWrapper, position: $position)';

  @override
  bool operator ==(covariant EmblemIcon other) {
    if (identical(this, other)) return true;

    return other.svgWrapper == svgWrapper && other.position == position;
  }

  @override
  int get hashCode => svgWrapper.hashCode ^ position.hashCode;
}
