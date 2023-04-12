import 'package:randpg/generators/generators.dart';
import 'package:randpg/src/generators/base/list_item_generator.dart';
import 'package:randpg/src/generators/guilds/history/guild_history_generator.dart';
import 'package:randpg/src/generators/guilds/mottos/guild_motto_generator.dart';
import 'package:randpg/src/generators/guilds/names/guild_adjective_name_generator.dart';
import 'package:randpg/src/generators/settlements/names/settlement_name_data.dart';
import 'package:randpg/src/subtypes/guilds/thieves_guild/quests/thieves_quest_generator.dart';
import 'package:randpg/src/subtypes/guilds/thieves_guild/reputation/thieves_reputation_generator.dart';
import 'package:randpg/src/subtypes/guilds/thieves_guild/specialties/thieves_specialty_generator.dart';

import '../../../generators/base/generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';

/// A class that represents a thieves guild
class ThievesGuild implements GuildType {
  const ThievesGuild();

  static const _guildType = "thieves guild";
  static const _leaderOccupation = "crime boss";
  static const _membersOccupations = [
    "thief",
    "master thief",
    "pickpocket",
    "burglar",
    "smuggler",
    "blackmailer",
    "assassin",
    "infiltrator",
    "informant",
  ];

  @override
  String getGuildType() => _guildType;

  @override
  IGenerator<String> getHistoryGenerator(String guildName) =>
      GuildHistoryGenerator(_guildType, guildName);

  @override
  String getLeaderOccupation() => _leaderOccupation;

  @override
  IGenerator<String> getMemberOccupationGenerator() =>
      ListItemGenerator(_membersOccupations);

  @override
  IGenerator<String> getMottoGenerator() => GuildMottoGenerator();

  @override
  IGenerator<String> getNameGenerator() => MultipleGenerator([
        GuildAdjectiveNameGenerator(),
        GuildVerbNameGenerator(),
      ]);

  @override
  IGenerator<String> getQuestGenerator() => ThievesQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => ThievesReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => ThievesSpecialtyGenerator();
}
