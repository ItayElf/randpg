import 'dart:convert';

/// A class that holds data about the hair of an npc
class Hair {
  final String length;
  final String type;
  final String color;

  const Hair({
    required this.length,
    required this.type,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'length': length,
      'type': type,
      'color': color,
    };
  }

  factory Hair.fromMap(Map<String, dynamic> map) {
    return Hair(
      length: map['length'],
      type: map['type'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hair.fromJson(String source) => Hair.fromMap(json.decode(source));

  @override
  String toString() => 'Hair(length: $length, type: $type, color: $color)';

  @override
  bool operator ==(covariant Hair other) {
    if (identical(this, other)) return true;

    return other.length == length && other.type == type && other.color == color;
  }

  @override
  int get hashCode => length.hashCode ^ type.hashCode ^ color.hashCode;
}
