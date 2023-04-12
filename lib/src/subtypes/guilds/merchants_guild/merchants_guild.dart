import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'quests/merchants_quest_generator.dart';
import 'reputation/merchants_reputation_generator.dart';
import 'specialties/merchants_specialty_generator.dart';

class MerchantsGuild implements GuildType {
  const MerchantsGuild();

  static const _guildType = "merchants guild";
  static const _leaderOccupation = "trade baron";
  static const _membersOccupations = [
    "merchant",
    "trader",
    "caravan trader",
    "master merchant",
    "caravan guard",
    "caravan leader",
    "ship captain",
    "tax collector"
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
  IGenerator<String> getQuestGenerator() => MerchantsQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => MerchantsReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => MerchantsSpecialtyGenerator();
}
