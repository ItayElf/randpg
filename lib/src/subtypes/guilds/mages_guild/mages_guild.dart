import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_title_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'quests/mages_quest_generator.dart';
import 'reputation/mages_reputation_generator.dart';
import 'specialties/mages_specialty_generator.dart';

/// A class that represents a mages guild
class MagesGuild implements GuildType {
  const MagesGuild();

  static const _guildType = "mages guild";
  static const _leaderOccupation = "archmage";
  static const _membersOccupations = [
    "mage",
    "wizard",
    "enchanter",
    "illusionist",
    "necromancer",
    "high mage",
    "high wizard",
  ];
  static const _guildTitles = [
    "mages",
    "wizards",
    "spellcasters",
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
  IGenerator<String> getQuestGenerator() => MagesQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => MagesReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => MagesSpecialtyGenerator();
}
