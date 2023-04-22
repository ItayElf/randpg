import '../../generators/base/generator.dart';
import '../guilds/guild_type.dart';
import '../races/race.dart';
import '../settlements/settlement_type.dart';
import 'government_types/government_type.dart';

/// A class that represents a generic kingdom type
abstract class KingdomType {
  /// Returns a generator for a kingdom's name
  IGenerator<String> getNameGenerator(Race race);

  /// Returns the type of the settings kingdom
  String getKingdomType();

  /// Returns a generator for the population of a kingdom
  IGenerator<int> getPopulationGenerator();

  /// Returns a generator for the settlement type for the capital of a kingdom
  IGenerator<SettlementType> getCapitalTypeGenerator();

  /// Returns a generator for the type of other important settlements in the kingdom
  IGenerator<SettlementType> getImportantSettlementsTypesGenerator();

  /// Returns a generator for something a kingdom is known for
  IGenerator<String> getKnownForGenerator();

  /// Returns a generator for the history of the kingdom
  IGenerator<String> getHistoryGenerator(String kingdomName);

  /// Returns a generator for the type of the guilds in the kingdom
  IGenerator<GuildType> getGuildTypeGenerator();

  /// Returns a generator for a trouble a kingdom has
  IGenerator<String> getTroubleGenerator();
}
