import '../../generators/base/generator.dart';
import '../emblems/emblem_type.dart';
import '../guilds/guild_type.dart';
import '../races/race.dart';
import '../settlements/settlement_type.dart';

/// A class that represents a generic kingdom type
abstract class KingdomType {
  /// Returns a generator for a kingdom's name
  Generator<String> getNameGenerator(Race race);

  /// Returns the type of the settings kingdom
  String getKingdomType();

  /// Returns a generator for the population of a kingdom
  Generator<int> getPopulationGenerator();

  /// Returns a generator for the settlement type for the capital of a kingdom
  Generator<SettlementType> getCapitalTypeGenerator();

  /// Returns a generator for the type of other important settlements in the kingdom
  Generator<SettlementType> getImportantSettlementsTypesGenerator();

  /// Returns the emblem type used by this kingdom type
  EmblemType getEmblemType();

  /// Returns a generator for something a kingdom is known for
  Generator<String> getKnownForGenerator();

  /// Returns a generator for the history of the kingdom
  Generator<String> getHistoryGenerator(String kingdomName);

  /// Returns a generator for the type of the guilds in the kingdom
  Generator<GuildType> getGuildTypeGenerator();

  /// Returns a generator for a trouble a kingdom has
  Generator<String> getTroubleGenerator();
}
