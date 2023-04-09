import 'dart:convert';

/// A class that represents the lore of the world
class WorldLore {
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
  final String godsPlanning;

  /// Somethings the gods are fearing
  final String godsFearing;

  const WorldLore({
    required this.everybodyKnows,
    required this.fewKnow,
    required this.nobodyKnows,
    required this.peasantsBelieve,
    required this.nobilityBelieves,
    required this.godsPlanning,
    required this.godsFearing,
  });

  WorldLore copyWith({
    String? everybodyKnows,
    String? fewKnow,
    String? nobodyKnows,
    String? peasantsBelieve,
    String? nobilityBelieves,
    String? godsPlanning,
    String? godsFearing,
  }) {
    return WorldLore(
      everybodyKnows: everybodyKnows ?? this.everybodyKnows,
      fewKnow: fewKnow ?? this.fewKnow,
      nobodyKnows: nobodyKnows ?? this.nobodyKnows,
      peasantsBelieve: peasantsBelieve ?? this.peasantsBelieve,
      nobilityBelieves: nobilityBelieves ?? this.nobilityBelieves,
      godsPlanning: godsPlanning ?? this.godsPlanning,
      godsFearing: godsFearing ?? this.godsFearing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'everybodyKnows': everybodyKnows,
      'fewKnow': fewKnow,
      'nobodyKnows': nobodyKnows,
      'peasantsBelieve': peasantsBelieve,
      'nobilityBelieves': nobilityBelieves,
      'godsPlanning': godsPlanning,
      'godsFearing': godsFearing,
    };
  }

  factory WorldLore.fromMap(Map<String, dynamic> map) {
    return WorldLore(
      everybodyKnows: map['everybodyKnows'] as String,
      fewKnow: map['fewKnow'] as String,
      nobodyKnows: map['nobodyKnows'] as String,
      peasantsBelieve: map['peasantsBelieve'] as String,
      nobilityBelieves: map['nobilityBelieves'] as String,
      godsPlanning: map['godsPlanning'] as String,
      godsFearing: map['godsFearing'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorldLore.fromJson(String source) =>
      WorldLore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorldLore(everybodyKnows: $everybodyKnows, fewKnow: $fewKnow, nobodyKnows: $nobodyKnows, peasantsBelieve: $peasantsBelieve, nobilityBelieves: $nobilityBelieves, godsPlanning: $godsPlanning, godsFearing: $godsFearing)';
  }

  @override
  bool operator ==(covariant WorldLore other) {
    if (identical(this, other)) return true;

    return other.everybodyKnows == everybodyKnows &&
        other.fewKnow == fewKnow &&
        other.nobodyKnows == nobodyKnows &&
        other.peasantsBelieve == peasantsBelieve &&
        other.nobilityBelieves == nobilityBelieves &&
        other.godsPlanning == godsPlanning &&
        other.godsFearing == godsFearing;
  }

  @override
  int get hashCode {
    return everybodyKnows.hashCode ^
        fewKnow.hashCode ^
        nobodyKnows.hashCode ^
        peasantsBelieve.hashCode ^
        nobilityBelieves.hashCode ^
        godsPlanning.hashCode ^
        godsFearing.hashCode;
  }
}
