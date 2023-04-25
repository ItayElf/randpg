import 'dart:convert';

/// A class that represents a position of an icon in an emblem
class IconPosition {
  /// The x position of the icon
  final int x;

  /// The y position of the icon
  final int y;

  /// The width and height of the icon
  final int size;

  const IconPosition({
    required this.x,
    required this.y,
    required this.size,
  });

  IconPosition copyWith({
    int? x,
    int? y,
    int? size,
  }) {
    return IconPosition(
      x: x ?? this.x,
      y: y ?? this.y,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
      'size': size,
    };
  }

  factory IconPosition.fromMap(Map<String, dynamic> map) {
    return IconPosition(
      x: map['x'] as int,
      y: map['y'] as int,
      size: map['size'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconPosition.fromJson(String source) =>
      IconPosition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IconPosition(x: $x, y: $y, size: $size)';

  @override
  bool operator ==(covariant IconPosition other) {
    if (identical(this, other)) return true;

    return other.x == x && other.y == y && other.size == size;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ size.hashCode;
}
