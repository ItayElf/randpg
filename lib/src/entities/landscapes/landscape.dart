import 'dart:convert';

import 'package:collection/collection.dart';

/// A class that represents a landscape
class Landscape {
  /// The name of the landscape
  final String name;

  /// The location of the landscape
  final String location;

  /// The weather in the landscape
  final String weather;

  /// The type of the landscape
  final String landscapeType;

  /// A list of features this landscape have
  final List<String> features;

  /// A list of resources that can be found in this landscape
  final List<String> resources;

  /// A list of possible encounters in the landscape
  final List<String> encounters;

  /// The thing this landscape is known for
  final String knownFor;

  /// A brief description of this landscape
  final String brief;

  /// The size of this landscape
  final String size;

  /// How often people go through this landscape
  final String travelRate;

  const Landscape({
    required this.name,
    required this.location,
    required this.weather,
    required this.landscapeType,
    required this.features,
    required this.resources,
    required this.encounters,
    required this.knownFor,
    required this.brief,
    required this.size,
    required this.travelRate,
  });

  Landscape copyWith({
    String? name,
    String? location,
    String? weather,
    String? landscapeType,
    List<String>? features,
    List<String>? resources,
    List<String>? encounters,
    String? knownFor,
    String? brief,
    String? size,
    String? travelRate,
  }) {
    return Landscape(
      name: name ?? this.name,
      location: location ?? this.location,
      weather: weather ?? this.weather,
      landscapeType: landscapeType ?? this.landscapeType,
      features: features ?? this.features,
      resources: resources ?? this.resources,
      encounters: encounters ?? this.encounters,
      knownFor: knownFor ?? this.knownFor,
      brief: brief ?? this.brief,
      size: size ?? this.size,
      travelRate: travelRate ?? this.travelRate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'weather': weather,
      'landscapeType': landscapeType,
      'features': features,
      'resources': resources,
      'encounters': encounters,
      'knownFor': knownFor,
      'brief': brief,
      'size': size,
      'travelRate': travelRate,
    };
  }

  factory Landscape.fromMap(Map<String, dynamic> map) {
    return Landscape(
      name: map['name'] as String,
      location: map['location'] as String,
      weather: map['weather'] as String,
      landscapeType: map['landscapeType'] as String,
      features: List<String>.from((map['features'] as List<String>)),
      resources: List<String>.from((map['resources'] as List<String>)),
      encounters: List<String>.from((map['encounters'] as List<String>)),
      knownFor: map['knownFor'] as String,
      brief: map['brief'] as String,
      size: map['size'] as String,
      travelRate: map['travelRate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Landscape.fromJson(String source) =>
      Landscape.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Landscape(name: $name, location: $location, weather: $weather, landscapeType: $landscapeType, features: $features, resources: $resources, encounters: $encounters, knownFor: $knownFor, brief: $brief, size: $size, travelRate: $travelRate)';
  }

  @override
  bool operator ==(covariant Landscape other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.location == location &&
        other.weather == weather &&
        other.landscapeType == landscapeType &&
        listEquals(other.features, features) &&
        listEquals(other.resources, resources) &&
        listEquals(other.encounters, encounters) &&
        other.knownFor == knownFor &&
        other.brief == brief &&
        other.size == size &&
        other.travelRate == travelRate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        weather.hashCode ^
        landscapeType.hashCode ^
        features.hashCode ^
        resources.hashCode ^
        encounters.hashCode ^
        knownFor.hashCode ^
        brief.hashCode ^
        size.hashCode ^
        travelRate.hashCode;
  }
}
