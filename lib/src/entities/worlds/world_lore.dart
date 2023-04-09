import 'dart:convert';

import 'package:randpg/src/subtypes/worlds/lore/world_lore_type.dart';
import 'package:randpg/src/subtypes/worlds/lore/world_lore_type_manager.dart';

/// A class that represents the lore of the world
class WorldLore {
  /// The type of this world lore (for backwards compatibility)
  final WorldLoreType loreType;

  /// Something everybody in the world knows
  final String everybodyKnows;

  /// Something only few people in the world know
  final String fewKnow;

  /// Something that nobody in the world knows
  final String nobodyKnows;

  /// Something all peasants in the world believe
  final String peasantsBelieve;

  /// Something the nobility in the world believes
  final String nobilityBelieves;

  /// Somethings the gods are planning
  final String godsPlan;

  /// Somethings the gods are fearing
  final String godsFear;

  const WorldLore({
    required this.loreType,
    required this.everybodyKnows,
    required this.fewKnow,
    required this.nobodyKnows,
    required this.peasantsBelieve,
    required this.nobilityBelieves,
    required this.godsPlan,
    required this.godsFear,
  });

  WorldLore copyWith({
    WorldLoreType? loreType,
    String? everybodyKnows,
    String? fewKnow,
    String? nobodyKnows,
    String? peasantsBelieve,
    String? nobilityBelieves,
    String? godsPlan,
    String? godsFear,
  }) {
    return WorldLore(
      loreType: loreType ?? this.loreType,
      everybodyKnows: everybodyKnows ?? this.everybodyKnows,
      fewKnow: fewKnow ?? this.fewKnow,
      nobodyKnows: nobodyKnows ?? this.nobodyKnows,
      peasantsBelieve: peasantsBelieve ?? this.peasantsBelieve,
      nobilityBelieves: nobilityBelieves ?? this.nobilityBelieves,
      godsPlan: godsPlan ?? this.godsPlan,
      godsFear: godsFear ?? this.godsFear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loreType': loreType.getLoreType(),
      'everybodyKnows': everybodyKnows,
      'fewKnow': fewKnow,
      'nobodyKnows': nobodyKnows,
      'peasantsBelieve': peasantsBelieve,
      'nobilityBelieves': nobilityBelieves,
      'godsPlan': godsPlan,
      'godsFear': godsFear,
    };
  }

  factory WorldLore.fromMap(Map<String, dynamic> map) {
    return WorldLore(
      loreType: WorldLoreManager.getWorldLoreTypeByType(map['loreType']),
      everybodyKnows: map['everybodyKnows'] as String,
      fewKnow: map['fewKnow'] as String,
      nobodyKnows: map['nobodyKnows'] as String,
      peasantsBelieve: map['peasantsBelieve'] as String,
      nobilityBelieves: map['nobilityBelieves'] as String,
      godsPlan: map['godsPlan'] as String,
      godsFear: map['godsFear'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorldLore.fromJson(String source) =>
      WorldLore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorldLore(loreType: $loreType, everybodyKnows: $everybodyKnows, fewKnow: $fewKnow, nobodyKnows: $nobodyKnows, peasantsBelieve: $peasantsBelieve, nobilityBelieves: $nobilityBelieves, godsPlan: $godsPlan, godsFear: $godsFear)';
  }

  @override
  bool operator ==(covariant WorldLore other) {
    if (identical(this, other)) return true;

    return other.loreType == loreType &&
        other.everybodyKnows == everybodyKnows &&
        other.fewKnow == fewKnow &&
        other.nobodyKnows == nobodyKnows &&
        other.peasantsBelieve == peasantsBelieve &&
        other.nobilityBelieves == nobilityBelieves &&
        other.godsPlan == godsPlan &&
        other.godsFear == godsFear;
  }

  @override
  int get hashCode {
    return loreType.hashCode ^
        everybodyKnows.hashCode ^
        fewKnow.hashCode ^
        nobodyKnows.hashCode ^
        peasantsBelieve.hashCode ^
        nobilityBelieves.hashCode ^
        godsPlan.hashCode ^
        godsFear.hashCode;
  }
}
