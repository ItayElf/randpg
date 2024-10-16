import '../../entities/kingdoms/kingdom.dart';
import '../../entities/npcs/npc.dart';
import '../../subtypes/holidays/holiday_type.dart';
import '../../subtypes/kingdoms/government_types/government_type.dart';
import '../../subtypes/kingdoms/kingdom_type.dart';
import '../../subtypes/races/race.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart ';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_batch_generator.dart';
import '../base/number_generator.dart';
import '../base/repeated_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../emblems/emblem_generator.dart';
import '../fixable.dart';
import '../holidays/holiday_generator.dart';
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
  static const _minNumberOfHolidays = 1;
  static const _maxNumberOfHolidays = 3;

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

    final numberOfHolidaysGenerator =
        NumberGenerator(_minNumberOfHolidays, _maxNumberOfHolidays)
          ..seed((_seed + 4) % SeedGenerator.maxSeed);
    final holidayTypesGenerator = RepeatedGenerator(
      _kingdomType.getHolidayTypeGenerator(),
      numberOfHolidaysGenerator.generate(),
    )..seed((_seed + 5) % SeedGenerator.maxSeed);
    final holidayTypes = holidayTypesGenerator.generate();

    final generator = BatchGenerator(_getBatch(
      numberOfLeaders,
      numberOfGuilds,
      _governmentType,
      name,
      holidayTypes,
    ));

    generator.seed((_seed + 6) % SeedGenerator.maxSeed);
    Kingdom kingdom = Kingdom.fromShallowMap(generator.generate());

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
    List<HolidayType> holidayTypes,
  ) =>
      {
        "name": ConstantGenerator(kingdomName),
        "kingdomType": ConstantGenerator(_kingdomType),
        "rulers": _getLeadersGenerator(numberOfLeaders, governmentType),
        "race": ConstantGenerator(_race),
        "population": _kingdomType.getPopulationGenerator(),
        "capital": KingdomSettlementGenerator(
          _kingdomType.getCapitalTypeGenerator(),
          _race,
        ),
        "importantSettlements": UniqueGenerator(
          KingdomSettlementGenerator(
              _kingdomType.getImportantSettlementsTypesGenerator(), _race),
          _numberOfSettlements,
        ),
        "governmentType": ConstantGenerator(governmentType),
        "emblem": EmblemGenerator(_kingdomType.getEmblemType()),
        "knownFor": _kingdomType.getKnownForGenerator(),
        "history": _kingdomType.getHistoryGenerator(kingdomName),
        "guilds": UniqueGenerator(
          KingdomGuildGenerator(_kingdomType.getGuildTypeGenerator()),
          numberOfGuilds,
        ),
        "trouble": _kingdomType.getTroubleGenerator(),
        "holidays": ListBatchGenerator(
          holidayTypes.map((x) => HolidayGenerator(x)).toList(),
        ),
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
