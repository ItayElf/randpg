import 'dart:convert';

import 'package:collection/collection.dart';

import '../npcs/npc.dart';

/// A class that represents a guild
class Guild {
  /// The name of this guild
  final String name;

  /// The leader of this guild
  final Npc leader;

  /// The type of this guild
  final String guildType;

  /// The reputation of this guild
  final String reputation;

  /// A description of the emblem of this guild
  final String emblem;

  /// A short history of this guild
  final String history;

  /// The motto of this guild
  final String motto;

  /// A list of specialties of this guild
  final List<String> specialties;

  /// A list of quests this guild is working on
  final List<String> quests;

  /// A list of some notable members of this guild
  final List<Npc> notableMembers;

  const Guild({
    required this.name,
    required this.leader,
    required this.guildType,
    required this.reputation,
    required this.emblem,
    required this.history,
    required this.motto,
    required this.specialties,
    required this.quests,
    required this.notableMembers,
  });

  Guild copyWith({
    String? name,
    Npc? leader,
    String? guildType,
    String? reputation,
    String? emblem,
    String? history,
    String? motto,
    List<String>? specialties,
    List<String>? quests,
    List<Npc>? notableMembers,
  }) {
    return Guild(
      name: name ?? this.name,
      leader: leader ?? this.leader,
      guildType: guildType ?? this.guildType,
      reputation: reputation ?? this.reputation,
      emblem: emblem ?? this.emblem,
      history: history ?? this.history,
      motto: motto ?? this.motto,
      specialties: specialties ?? this.specialties,
      quests: quests ?? this.quests,
      notableMembers: notableMembers ?? this.notableMembers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'leader': leader.toMap(),
      'guildType': guildType,
      'reputation': reputation,
      'emblem': emblem,
      'history': history,
      'motto': motto,
      'specialties': specialties,
      'quests': quests,
      'notableMembers': notableMembers.map((x) => x.toMap()).toList(),
    };
  }

  factory Guild.fromMap(Map<String, dynamic> map) {
    return Guild(
      name: map['name'] as String,
      leader: Npc.fromMap(map['leader'] as Map<String, dynamic>),
      guildType: map['guildType'] as String,
      reputation: map['reputation'] as String,
      emblem: map['emblem'] as String,
      history: map['history'] as String,
      motto: map['motto'] as String,
      specialties: List<String>.from((map['specialties'] as List<String>)),
      quests: List<String>.from((map['quests'] as List<String>)),
      notableMembers: List<Npc>.from(
        (map['notableMembers'] as List<Map<String, dynamic>>).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Guild.fromJson(String source) =>
      Guild.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Guild(name: $name, leader: $leader, guildType: $guildType, reputation: $reputation, emblem: $emblem, history: $history, motto: $motto, specialties: $specialties, quests: $quests, notableMembers: $notableMembers)';
  }

  @override
  bool operator ==(covariant Guild other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.leader == leader &&
        other.guildType == guildType &&
        other.reputation == reputation &&
        other.emblem == emblem &&
        other.history == history &&
        other.motto == motto &&
        listEquals(other.specialties, specialties) &&
        listEquals(other.quests, quests) &&
        listEquals(other.notableMembers, notableMembers);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        leader.hashCode ^
        guildType.hashCode ^
        reputation.hashCode ^
        emblem.hashCode ^
        history.hashCode ^
        motto.hashCode ^
        specialties.hashCode ^
        quests.hashCode ^
        notableMembers.hashCode;
  }
}
