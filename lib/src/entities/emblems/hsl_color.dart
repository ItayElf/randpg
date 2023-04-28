import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';

/// A class that represents an hsl color
class HslColor {
  /// The hue of the color, 0 to 360
  final num h;

  /// The saturation of the color, 0% to 100%
  final num s;

  /// The lightness of the color, 0% to 100%
  final num l;

  static const _linearValueThreshold = 0.03928;

  const HslColor({
    required this.h,
    required this.s,
    required this.l,
  });

  /// Returns the luminance of the color
  double get luminance {
    final rgbMap = getRGBMap();
    double red = _getLinearValue(rgbMap["r"]! / 255),
        green = _getLinearValue(rgbMap["g"]! / 255),
        blue = _getLinearValue(rgbMap["b"]! / 255);

    return 0.2126 * red + 0.7152 * green + 0.0722 * blue;
  }

  double _getLinearValue(double value) {
    if (value > _linearValueThreshold) {
      return pow((value + 0.055) / 1.055, 2.4).toDouble();
    }
    return value / 12.92;
  }

  /// Returns a map with "r", "g", "b" keys that represents the rgb values of the color
  Map<String, int> getRGBMap() {
    num percentSaturation = s / 100;
    num percentLightness = l / 100;

    num c = (1 - (2 * percentLightness - 1).abs()) * percentSaturation;
    num x = c * (1 - ((h / 60) % 2 - 1).abs());
    num m = percentLightness - c / 2;

    num r, g, b;
    if (h < 60) {
      r = c;
      g = x;
      b = 0;
    } else if (h < 120) {
      r = x;
      g = c;
      b = 0;
    } else if (h < 180) {
      r = 0;
      g = c;
      b = x;
    } else if (h < 240) {
      r = 0;
      g = x;
      b = c;
    } else if (h < 300) {
      r = x;
      g = 0;
      b = c;
    } else {
      r = c;
      g = 0;
      b = x;
    }

    int red = ((r + m) * 255).round();
    int green = ((g + m) * 255).round();
    int blue = ((b + m) * 255).round();

    return {"r": red, "g": green, "b": blue};
  }

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
      return HslColor(h: 0, s: 0, l: l);
    }

    double h;
    if (maxValue == r / 255) {
      h = 60 * (((g / 255 - b / 255) / delta) % 6);
    } else if (maxValue == g / 255) {
      h = 60 * ((b / 255 - r / 255) / delta + 2);
    } else {
      h = 60 * ((r / 255 - g / 255) / delta + 4);
    }

    return HslColor(h: h, s: s * 100, l: l * 100);
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
