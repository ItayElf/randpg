// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/locations/location_manager.dart';
import '../../subtypes/locations/location_type.dart';
import '../npcs/npc.dart';
import 'goods.dart';

/// A class that represents a location in a settlement
class Location {
  /// The name of the location
  final String name;

  /// The owner of the location
  final Npc owner;

  /// The type of the location (shop, monument, etc.)
  final LocationType type;

  /// The zone in the settlement this location appears in
  final String zone;

  /// The descriptions of the street outside the location
  final List<String> outsideDescription;

  /// The description of the building itself
  final String buildingDescription;

  /// A list with goods, null if there are no goods in the location
  final List<Goods>? goods;

  const Location({
    required this.name,
    required this.owner,
    required this.type,
    required this.zone,
    required this.outsideDescription,
    required this.buildingDescription,
    this.goods,
  });

  Location copyWith({
    String? name,
    Npc? owner,
    LocationType? type,
    String? zone,
    List<String>? outsideDescription,
    String? buildingDescription,
    List<Goods>? goods,
  }) {
    return Location(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      type: type ?? this.type,
      zone: zone ?? this.zone,
      outsideDescription: outsideDescription ?? this.outsideDescription,
      buildingDescription: buildingDescription ?? this.buildingDescription,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'owner': owner.toMap(),
      'type': type.getLocationType(),
      'zone': zone,
      'outsideDescription': outsideDescription,
      'buildingDescription': buildingDescription,
      'goods': goods?.map((x) => x.toMap()).toList(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      owner: Npc.fromMap(map['owner'] as Map<String, dynamic>),
      type: LocationManager.getLocationTypeByType(map['type']),
      zone: map['zone'] as String,
      outsideDescription:
          List<String>.from((map['outsideDescription'] as List<String>)),
      buildingDescription: map['buildingDescription'] as String,
      goods: map['goods'] != null
          ? List<Goods>.from(
              (map['goods'] as List<Map<String, dynamic>>).map<Goods?>(
                (x) => Goods.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(name: $name, owner: $owner, type: $type, zone: $zone, outsideDescription: $outsideDescription, buildingDescription: $buildingDescription, goods: $goods)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.owner == owner &&
        other.type == type &&
        other.zone == zone &&
        listEquals(other.outsideDescription, outsideDescription) &&
        other.buildingDescription == buildingDescription &&
        listEquals(other.goods, goods);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        owner.hashCode ^
        type.hashCode ^
        zone.hashCode ^
        outsideDescription.hashCode ^
        buildingDescription.hashCode ^
        goods.hashCode;
  }
}
