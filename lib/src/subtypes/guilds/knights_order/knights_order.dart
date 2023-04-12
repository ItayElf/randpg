import '../../../generators/base/future_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/guilds/history/guild_history_generator.dart';
import '../../../generators/guilds/mottos/guild_motto_generator.dart';
import '../../../generators/guilds/names/guild_adjective_name_generator.dart';
import '../../../generators/guilds/names/guild_verb_name_generator.dart';
import '../guild_type.dart';
import 'names/knights_order_name_generator.dart';
import 'quests/knights_quest_generator.dart';
import 'reputation/knights_reputation.dart';
import 'specialties/knights_specialty_generator.dart';

/// A class that represents a knights order
class KnightsOrder implements GuildType {
  const KnightsOrder();

  static const _guildType = "knights order";
  static const _leaderOccupation = "grand commander";
  static const _membersOccupations = [
    "knight",
    "squire",
    "chaplain",
    "commander",
    "cleric",
    "paladin",
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
          (name) => "Knights Of $name",
        ),
        GuildVerbNameGenerator(),
        KnightsOrderNameGenerator(),
      ]);

  @override
  IGenerator<String> getQuestGenerator() => KnightsQuestGenerator();

  @override
  IGenerator<String> getReputationGenerator() => KnightsReputationGenerator();

  @override
  IGenerator<String> getSpecialtyGenerator() => KnightsSpecialtyGenerator();
}
