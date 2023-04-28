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
import 'quests/cult_quest_generator.dart';
import 'reputation/cult_reputation_generator.dart';
import 'specialties/cult_specialty_generator.dart';

/// A class that represents a cult guild type
class Cult implements GuildType {
  const Cult();

  static const _guildType = "cult";
  static const _leaderOccupation = "cult leader";
  static const _membersOccupations = [
    "cultist",
    "acolyte",
    "cult fanatic",
  ];
  static const _guildTitles = [
    "cult",
    "cultists",
    "order",
    "brotherhood",
    "sisterhood",
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
  IGenerator<String> getQuestGenerator() => CultQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => CultReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => CultSpecialtyGenerator();

  @override
  EmblemType getEmblemType() => DefaultEmblemType();
}
