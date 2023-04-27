import 'dart:convert';

import 'package:collection/collection.dart';

/// A class that represents an hsl color
class HslColor {
  /// The hue of the color, 0 to 360
  final num h;

  /// The saturation of the color, 0% to 100%
  final num s;

  /// The lightness of the color, 0% to 100%
  final num l;

  const HslColor({
    required this.h,
    required this.s,
    required this.l,
  });

  HslColor copyWith({
    num? h,
    num? s,
    num? l,
  }) {
    return HslColor(
      h: h ?? this.h,
      s: s ?? this.s,
      l: l ?? this.l,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'h': h,
      's': s,
      'l': l,
    };
  }

  /// Returns an [HslColor] from RGB
  factory HslColor.fromRGB(int r, int g, int b) {
    final maxValue = [r, g, b].max / 255;
    final minValue = [r, g, b].min / 255;
    final delta = maxValue - minValue;

    final l = (maxValue + minValue) / 2;
    final s = delta / (1 - (2 * l - 1).abs());

    if (delta == 0) {
      return HslColor(h: 0, s: s, l: l);
    }

    double h;
    if (maxValue == r / 255) {
      h = 60 * (((g / 255 - b / 255) / delta) % 6);
    } else if (maxValue == g / 255) {
      h = 60 * ((b / 255 - r / 255) / delta + 2);
    } else {
      h = 60 * ((r / 255 - g / 255) / delta + 4);
    }

    return HslColor(h: h, s: s, l: l);
  }

  factory HslColor.fromMap(Map<String, dynamic> map) {
    return HslColor(
      h: map['h'] as num,
      s: map['s'] as num,
      l: map['l'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory HslColor.fromJson(String source) =>
      HslColor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'hsl($h, $s%, $l%)';

  @override
  bool operator ==(covariant HslColor other) {
    if (identical(this, other)) return true;

    return other.h == h && other.s == s && other.l == l;
  }

  @override
  int get hashCode => h.hashCode ^ s.hashCode ^ l.hashCode;
}
