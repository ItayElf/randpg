import '../../entities/kingdoms/kingdom.dart';
import '../../entities/npcs/npc.dart';
import '../../subtypes/kingdoms/government_types/government_type.dart';
import '../../subtypes/kingdoms/kingdom_type.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/number_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../emblems/emblem_generator.dart';
import '../fixable.dart';
import '../npcs/npc_generator.dart';
import 'guilds/kingdom_guild_generator.dart';
import 'settlements/kingdom_settlement_generator.dart';

class KingdomGenerator implements Generator<Kingdom> {
  late int _seed;
  final KingdomType _kingdomType;
  final Race _race;
  final GovernmentType _governmentType;

  static const _numberOfSettlements = 3;
  static const _minNumberOfGuilds = 1;
  static const _maxNumberOfGuilds = 2;

  KingdomGenerator(this._kingdomType, this._race, this._governmentType) {
    _seed = SeedGenerator.generate();
  }

  @override
  Kingdom generate() {
    final leadersGenerator = _governmentType.getNumberOfLeadersGenerator();
    leadersGenerator.seed((_seed + 1) % SeedGenerator.generate());
    final numberOfLeaders = leadersGenerator.generate();

    final nameGenerator = _kingdomType.getNameGenerator(_race);
    nameGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final name = nameGenerator.generate();

    final numberOfGuildsGenerator =
        NumberGenerator(_minNumberOfGuilds, _maxNumberOfGuilds + 1);
    numberOfGuildsGenerator.seed((_seed + 3) % SeedGenerator.maxSeed);
    final numberOfGuilds = numberOfGuildsGenerator.generate();

    final generator = BatchGenerator(_getBatch(
      numberOfLeaders,
      numberOfGuilds,
      _governmentType,
      name,
    ));
    generator.seed((_seed + 4) % SeedGenerator.maxSeed);
    Kingdom kingdom = Kingdom.fromMap(generator.generate());

    if (_kingdomType is Fixable<Kingdom>) {
      kingdom = (_kingdomType as Fixable).getFixed(kingdom);
    }

    return kingdom;
  }

  Map<String, Generator> _getBatch(
    int numberOfLeaders,
    int numberOfGuilds,
    GovernmentType governmentType,
    String kingdomName,
  ) =>
      {
        "name": ListItemGenerator([kingdomName]),
        "kingdomType": ListItemGenerator([_kingdomType.getKingdomType()]),
        "rulers": FutureGenerator(
          _getLeadersGenerator(numberOfLeaders, governmentType),
          (leaders) => leaders.map((e) => e.toMap()).toList(),
        ),
        "race": ListItemGenerator([_race.getName()]),
        "population": _kingdomType.getPopulationGenerator(),
        "capital": FutureGenerator(
          KingdomSettlementGenerator(
            _kingdomType.getCapitalTypeGenerator(),
            _race,
          ),
          (capital) => capital.toMap(),
        ),
        "importantSettlements": FutureGenerator(
          UniqueGenerator(
            KingdomSettlementGenerator(
                _kingdomType.getImportantSettlementsTypesGenerator(), _race),
            _numberOfSettlements,
          ),
          (settlements) => settlements.map((e) => e.toMap()).toList(),
        ),
        "governmentType":
            ListItemGenerator([governmentType.getGovernmentType()]),
        "emblem": FutureGenerator(
          EmblemGenerator(_kingdomType.getEmblemType()),
          (emblem) => emblem.toMap(),
        ),
        "knownFor": _kingdomType.getKnownForGenerator(),
        "history": _kingdomType.getHistoryGenerator(kingdomName),
        "guilds": FutureGenerator(
          UniqueGenerator(
            KingdomGuildGenerator(_kingdomType.getGuildTypeGenerator()),
            numberOfGuilds,
          ),
          (guilds) => guilds.map((e) => e.toMap()).toList(),
        ),
        "trouble": _kingdomType.getTroubleGenerator(),
      };

  Generator<List<Npc>> _getLeadersGenerator(
    int numberOfLeaders,
    GovernmentType governmentType,
  ) =>
      FutureGenerator(
        UniqueGenerator(NpcGenerator(_race), numberOfLeaders),
        (leaders) => leaders
            .map((e) => e.copyWith(
                  occupation: governmentType.getLeaderOccupation(e.gender),
                ))
            .toList(),
      );

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
