import 'dart:convert';

import 'package:collection/collection.dart';

import '../../subtypes/guilds/guild_manager.dart';
import '../../subtypes/guilds/guild_type.dart';
import '../emblems/emblem.dart';
import '../npcs/npc.dart';

/// A class that represents a guild
class Guild {
  /// The name of this guild
  final String name;

  /// The leader of this guild
  final Npc leader;

  /// The type of this guild
  final GuildType guildType;

  /// The reputation of this guild
  final String reputation;

  /// A short history of this guild
  final String history;

  /// The emblem of the guild
  final Emblem emblem;

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
    required this.history,
    required this.emblem,
    required this.motto,
    required this.specialties,
    required this.quests,
    required this.notableMembers,
  });

  Guild copyWith({
    String? name,
    Npc? leader,
    GuildType? guildType,
    String? reputation,
    String? history,
    Emblem? emblem,
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
      history: history ?? this.history,
      emblem: emblem ?? this.emblem,
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
      'guildType': guildType.getGuildType(),
      'reputation': reputation,
      'history': history,
      'emblem': emblem.toMap(),
      'motto': motto,
      'specialties': specialties,
      'quests': quests,
      'notableMembers': notableMembers.map((x) => x.toMap()).toList(),
    };
  }

  factory Guild.fromMap(Map<String, dynamic> map) {
    return Guild(
      name: map['name'],
      leader: Npc.fromMap(map['leader']),
      guildType: GuildManager().getType(map['guildType']),
      reputation: map['reputation'],
      history: map['history'],
      emblem: Emblem.fromMap(map['emblem']),
      motto: map['motto'],
      specialties: List<String>.from((map['specialties'])),
      quests: List<String>.from((map['quests'])),
      notableMembers: List<Npc>.from(
        (map['notableMembers']).map<Npc>(
          (x) => Npc.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Guild.fromJson(String source) => Guild.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Guild(name: $name, leader: $leader, guildType: $guildType, reputation: $reputation, history: $history, emblem: $emblem, motto: $motto, specialties: $specialties, quests: $quests, notableMembers: $notableMembers)';
  }

  @override
  bool operator ==(covariant Guild other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.leader == leader &&
        other.guildType == guildType &&
        other.reputation == reputation &&
        other.history == history &&
        other.emblem == emblem &&
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
        history.hashCode ^
        emblem.hashCode ^
        motto.hashCode ^
        specialties.hashCode ^
        quests.hashCode ^
        notableMembers.hashCode;
  }
}
