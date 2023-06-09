import 'dart:convert';

import 'package:collection/collection.dart';

import '../../enums/gender.dart';
import '../../subtypes/deities/deity_manager.dart';
import '../../subtypes/deities/deity_type.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../npcs/alignment.dart';

/// A class that represents the deity entity
class Deity {
  /// The name of the deity
  final String name;

  /// The gender of the deity, null for genderless
  final Gender? gender;

  /// The type of the deity (god, angel, demon, etc.)
  final DeityType deityType;

  /// A list of domains related to this deity
  final List<String> domains;

  /// The alignment of this deity, null for unaligned
  final Alignment? alignment;

  /// How this deity is depicted
  final String depiction;

  /// The race who worship this deity, null if this deity is worshiped by many races
  final Race? worshipedBy;

  /// A description of how many worshippers this deity has
  final String worshipers;

  /// How rare are shrines for this deity
  final String shrinesRarity;

  /// A positive attribute of this deity, often how their worshipers believe they are
  final String positiveAttribute;

  /// A negative attribute of this deity, often how their nonbelievers believe they are
  final String negativeAttribute;

  const Deity({
    required this.name,
    this.gender,
    required this.deityType,
    required this.domains,
    this.alignment,
    required this.depiction,
    this.worshipedBy,
    required this.worshipers,
    required this.shrinesRarity,
    required this.positiveAttribute,
    required this.negativeAttribute,
  });

  Deity copyWith({
    String? name,
    Gender? gender,
    DeityType? deityType,
    List<String>? domains,
    Alignment? alignment,
    String? depiction,
    Race? worshipedBy,
    String? worshipers,
    String? shrinesRarity,
    String? positiveAttribute,
    String? negativeAttribute,
  }) {
    return Deity(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      deityType: deityType ?? this.deityType,
      domains: domains ?? this.domains,
      alignment: alignment ?? this.alignment,
      depiction: depiction ?? this.depiction,
      worshipedBy: worshipedBy ?? this.worshipedBy,
      worshipers: worshipers ?? this.worshipers,
      shrinesRarity: shrinesRarity ?? this.shrinesRarity,
      positiveAttribute: positiveAttribute ?? this.positiveAttribute,
      negativeAttribute: negativeAttribute ?? this.negativeAttribute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender?.name,
      'deityType': deityType.getDeityType(),
      'domains': domains,
      'alignment': alignment?.toMap(),
      'depiction': depiction,
      'worshipedBy': worshipedBy?.getName(),
      'worshipers': worshipers,
      'shrinesRarity': shrinesRarity,
      'positiveAttribute': positiveAttribute,
      'negativeAttribute': negativeAttribute,
    };
  }

  factory Deity.fromMap(Map<String, dynamic> map) {
    return Deity(
      name: map['name'],
      gender:
          map['gender'] != null ? Gender.values.byName(map['gender']) : null,
      deityType: DeityManager.getDeityTypeByType(map['deityType']),
      domains: List<String>.from((map['domains'])),
      alignment:
          map['alignment'] != null ? Alignment.fromMap(map['alignment']) : null,
      depiction: map['depiction'],
      worshipedBy: map['worshipedBy'] != null
          ? RaceManager.getRaceByName(map['worshipedBy'])
          : null,
      worshipers: map['worshipers'],
      shrinesRarity: map['shrinesRarity'],
      positiveAttribute: map['positiveAttribute'],
      negativeAttribute: map['negativeAttribute'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Deity.fromJson(String source) => Deity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Deity(name: $name, gender: $gender, deityType: $deityType, domains: $domains, alignment: $alignment, depiction: $depiction, worshipedBy: $worshipedBy, worshipers: $worshipers, shrinesRarity: $shrinesRarity, positiveAttribute: $positiveAttribute, negativeAttribute: $negativeAttribute)';
  }

  @override
  bool operator ==(covariant Deity other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.gender == gender &&
        other.deityType == deityType &&
        listEquals(other.domains, domains) &&
        other.alignment == alignment &&
        other.depiction == depiction &&
        other.worshipedBy == worshipedBy &&
        other.worshipers == worshipers &&
        other.shrinesRarity == shrinesRarity &&
        other.positiveAttribute == positiveAttribute &&
        other.negativeAttribute == negativeAttribute;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        gender.hashCode ^
        deityType.hashCode ^
        domains.hashCode ^
        alignment.hashCode ^
        depiction.hashCode ^
        worshipedBy.hashCode ^
        worshipers.hashCode ^
        shrinesRarity.hashCode ^
        positiveAttribute.hashCode ^
        negativeAttribute.hashCode;
  }
}
