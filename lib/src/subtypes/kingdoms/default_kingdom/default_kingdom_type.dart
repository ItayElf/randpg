import '../../emblems/default/default_emblem_type.dart';
import '../../emblems/emblem_type.dart';
import '../../../entities/kingdoms/kingdom.dart';
import '../../../generators/base/future_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/fixable.dart';
import '../../../generators/kingdoms/history/kingdom_history_generator.dart';
import '../../../generators/kingdoms/known_for/kingdom_known_for_generator.dart';
import '../../../generators/kingdoms/trouble/kingdom_trouble_generator.dart';
import '../../../generators/settlements/names/dominant_race_name_generator.dart';
import '../../guilds/guild_manager.dart';
import '../../guilds/guild_type.dart';
import '../../races/race.dart';
import '../../settlements/city/city.dart';
import '../../settlements/metropolis/metropolis.dart';
import '../../settlements/settlement_type.dart';
import '../../settlements/town/town.dart';
import '../kingdom_type.dart';

/// A class that represents the default kingdom type
class DefaultKingdomType implements KingdomType, Fixable<Kingdom> {
  const DefaultKingdomType();

  static const _kingdomType = "default";
  static const _minPopulation = 80000;
  static const _maxPopulation = 11000000;
  static const _populationBarrier = 25000;

  @override
  Generator<SettlementType> getCapitalTypeGenerator() => ListItemGenerator([
        Metropolis(),
        City(),
      ]);

  @override
  Generator<GuildType> getGuildTypeGenerator() =>
      ListItemGenerator(GuildManager().activeTypes);

  @override
  Generator<String> getHistoryGenerator(String kingdomName) =>
      KingdomHistoryGenerator(kingdomName);

  @override
  Generator<SettlementType> getImportantSettlementsTypesGenerator() =>
      ListItemGenerator([
        City(),
        Town(),
      ]);

  @override
  Generator<String> getKnownForGenerator() => KingdomKnownForGenerator();

  @override
  Generator<String> getNameGenerator(Race race) =>
      DominantRaceNameGenerator(race);

  @override
  Generator<int> getPopulationGenerator() => FutureGenerator(
        NumberGenerator(_minPopulation, _maxPopulation),
        (population) => population ~/ 1000 * 1000,
      );

  @override
  Generator<String> getTroubleGenerator() => KingdomTroubleGenerator();

  @override
  String getKingdomType() => _kingdomType;

  @override
  Kingdom getFixed(Kingdom kingdom) {
    final populations = [
      ...kingdom.importantSettlements.map((e) => e.population),
      kingdom.capital.population,
    ];
    final populationSum =
        populations.reduce((value, element) => value + element);

    if (populationSum + _populationBarrier >= kingdom.population) {
      return kingdom.copyWith(population: kingdom.population * 10);
    }
    return kingdom;
  }

  @override
  EmblemType getEmblemType() => DefaultEmblemType();
}
