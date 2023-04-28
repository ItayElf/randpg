import '../../emblems/default/default_emblem_type.dart';
import '../../emblems/emblem_type.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_title_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'quests/thieves_quest_generator.dart';
import 'reputation/thieves_reputation_generator.dart';
import 'specialties/thieves_specialty_generator.dart';

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
  static const _guildTitles = [
    "thieves",
    "criminals",
    "bandits",
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
        GuildTitleNameGenerator(ListItemGenerator(_guildTitles)),
      ]);

  @override
  IGenerator<String> getQuestGenerator() => ThievesQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => ThievesReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => ThievesSpecialtyGenerator();

  @override
  EmblemType getEmblemType() => DefaultEmblemType();
}
