import '../../../generators/base/generator.dart';
import '../../emblems/default/default_emblem_type.dart';
import '../../emblems/emblem_type.dart';
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
  Generator<String> getHistoryGenerator(String guildName) =>
      GuildHistoryGenerator(_guildType, guildName);

  @override
  String getLeaderOccupation() => _leaderOccupation;

  @override
  Generator<String> getMemberOccupationGenerator() =>
      ListItemGenerator(_membersOccupations);

  @override
  Generator<String> getMottoGenerator() => GuildMottoGenerator();

  @override
  Generator<String> getNameGenerator() => MultipleGenerator([
        GuildAdjectiveNameGenerator(),
        GuildVerbNameGenerator(),
        GuildTitleNameGenerator(ListItemGenerator(_guildTitles)),
      ]);

  @override
  Generator<String> getQuestGenerator() => MagesQuestGenerator();

  @override
  Generator<String> getReputationGenerator() => MagesReputationGenerator();

  @override
  Generator<String> getSpecialtyGenerator() => MagesSpecialtyGenerator();

  @override
  EmblemType getEmblemType() => DefaultEmblemType();
}
