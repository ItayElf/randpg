import 'dart:convert';

import 'package:collection/collection.dart';

/// A class that represents a holiday
class Holiday {
  /// The name of the holiday
  final String name;

  /// The abstract date of the holiday (in the summer, first rain, full moon, etc.)
  final String date;

  /// The duration the holiday is celebrated
  final String duration;

  /// The origin of the holiday
  final String origin;

  /// Who celebrates the holiday
  final String celebratedBy;

  /// What are the traditions of this holiday
  final List<String> traditions;

  Holiday({
    required this.name,
    required this.date,
    required this.duration,
    required this.origin,
    required this.celebratedBy,
    required this.traditions,
  });

  Holiday copyWith({
    String? name,
    String? date,
    String? duration,
    String? origin,
    String? celebratedBy,
    List<String>? traditions,
  }) {
    return Holiday(
      name: name ?? this.name,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      origin: origin ?? this.origin,
      celebratedBy: celebratedBy ?? this.celebratedBy,
      traditions: traditions ?? this.traditions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'date': date,
      'duration': duration,
      'origin': origin,
      'celebratedBy': celebratedBy,
      'traditions': traditions,
    };
  }

  factory Holiday.fromMap(Map<String, dynamic> map) {
    return Holiday(
      name: map['name'] as String,
      date: map['date'] as String,
      duration: map['duration'] as String,
      origin: map['origin'] as String,
      celebratedBy: map['celebratedBy'] as String,
      traditions: List<String>.from((map['traditions'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Holiday.fromJson(String source) =>
      Holiday.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Holiday(name: $name, date: $date, duration: $duration, origin: $origin, celebratedBy: $celebratedBy, traditions: $traditions)';
  }

  @override
  bool operator ==(covariant Holiday other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.date == date &&
        other.duration == duration &&
        other.origin == origin &&
        other.celebratedBy == celebratedBy &&
        listEquals(other.traditions, traditions);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        date.hashCode ^
        duration.hashCode ^
        origin.hashCode ^
        celebratedBy.hashCode ^
        traditions.hashCode;
  }
}
