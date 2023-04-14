import '../../entities/kingdoms/kingdom.dart';
import '../../entities/npcs/npc.dart';
import '../../subtypes/kingdoms/government_types/government_type.dart';
import '../../subtypes/kingdoms/kingdom_type.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../fixable.dart';
import '../npcs/npc_generator.dart';
import 'guilds/kingdom_guild_generator.dart';
import 'settlements/kingdom_settlement_generator.dart';

class KingdomGenerator implements IGenerator<Kingdom> {
  late int _seed;
  final KingdomType _kingdomType;
  final Race _race;

  static const _numberOfSettlements = 3;

  KingdomGenerator(this._kingdomType, this._race) {
    _seed = SeedGenerator.generate();
  }

  @override
  Kingdom generate() {
    final governmentGenerator = _kingdomType.getGovernmentTypeGenerator();
    governmentGenerator.seed(_seed);
    final governmentType = governmentGenerator.generate();

    final leadersGenerator = governmentType.getNumberOfLeadersGenerator();
    leadersGenerator.seed((_seed + 1) % SeedGenerator.generate());
    final numberOfLeaders = leadersGenerator.generate();

    final nameGenerator = _kingdomType.getNameGenerator(_race);
    nameGenerator.seed((_seed + 2) % SeedGenerator.maxSeed);
    final name = nameGenerator.generate();

    final generator =
        BatchGenerator(_getBatch(numberOfLeaders, governmentType, name));
    generator.seed((_seed + 3) % SeedGenerator.maxSeed);
    Kingdom kingdom = Kingdom.fromMap(generator.generate());

    if (_kingdomType is Fixable<Kingdom>) {
      kingdom = (_kingdomType as Fixable).getFixed(kingdom);
    }

    return kingdom;
  }

  Map<String, IGenerator> _getBatch(
    int numberOfLeaders,
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
        "capital": KingdomSettlementGenerator(
            _kingdomType.getCapitalTypeGenerator(), _race),
        "importantSettlements": UniqueGenerator(
          KingdomSettlementGenerator(
              _kingdomType.getCapitalTypeGenerator(), _race),
          _numberOfSettlements,
        ),
        "governmentType":
            ListItemGenerator([governmentType.getGovernmentType()]),
        "knownFor": _kingdomType.getKnownForGenerator(),
        "history": _kingdomType.getHistoryGenerator(kingdomName),
        "guilds": UniqueGenerator(
          KingdomGuildGenerator(_kingdomType.getGuildTypeGenerator()),
          _numberOfSettlements,
        ),
        "trouble": _kingdomType.getTroubleGenerator(),
      };

  IGenerator<List<Npc>> _getLeadersGenerator(
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
