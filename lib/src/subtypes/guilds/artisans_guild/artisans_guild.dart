import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_title_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'quests/artisans_quest_generator.dart';
import 'reputation/artisan_reputation_generator.dart';
import 'specialties/artisans_specialty_generator.dart';

/// A class that represents an artisans guild
class ArtisansGuild implements GuildType {
  const ArtisansGuild();

  static const _guildType = "artisans guild";
  static const _leaderOccupation = "guild master";
  static const _membersOccupations = [
    "artisan",
    "craftsman",
    "apprentice",
    "master artisan",
  ];
  static const _guildTitles = [
    "artisans",
    "craftsmen",
    "makers",
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
  IGenerator<String> getQuestGenerator() => ArtisansQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => ArtisansReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => ArtisansSpecialtyGenerator();
}
