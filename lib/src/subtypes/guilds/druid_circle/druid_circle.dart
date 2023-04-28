import '../../emblems/default/default_emblem_type.dart';
import '../../emblems/emblem_type.dart';
import '../../../generators/base/future_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_title_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'quests/druids_quest_generator.dart';
import 'reputation/druid_reputation_generator.dart';
import 'specialties/druids_specialty_generator.dart';

/// A class that represents the druid circle guild type
class DruidCircle implements GuildType {
  const DruidCircle();

  static const _guildType = "druid circle";
  static const _leaderOccupation = "archdruid";
  static const _membersOccupations = [
    "druid",
    "high druid",
    "herbalist",
    "shaman",
    "seer",
  ];
  static const _guildTitles = [
    "druids",
    "circle",
    "council",
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
        FutureGenerator(
          GuildAdjectiveNameGenerator(),
          (name) => "Circle Of $name",
        ),
        GuildVerbNameGenerator(),
        GuildTitleNameGenerator(ListItemGenerator(_guildTitles)),
      ]);

  @override
  IGenerator<String> getQuestGenerator() => DruidsQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => DruidsReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => DruidsSpecialtyGenerator();

  @override
  EmblemType getEmblemType() => DefaultEmblemType();
}
