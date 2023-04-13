import '../../../entities/settlements/settlement.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/races/race_manager.dart';
import '../../../subtypes/settlements/settlement_type.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../settlements/settlement_generator.dart';

/// A class that generates settlements for worlds
class WorldSettlementsGenerator implements IGenerator<List<Settlement>> {
  late int _seed;
  final WorldSettings _worldSettings;

  WorldSettlementsGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Settlement> generate() {
    final settlements = _worldSettings.getSettlementTypes();
    final settlementTypes = List.generate(
      settlements.length,
      (index) => _getSettlementType(
        (_seed + index) % SeedGenerator.maxSeed,
        settlements[index],
      ),
    );

    return List.generate(
      settlementTypes.length,
      (index) => _generateSettlement(
        (_seed + index) % SeedGenerator.maxSeed,
        settlementTypes[index],
      ),
    );
  }

  Settlement _generateSettlement(int seed, SettlementType settlementType) {
    final race = _generateRace(seed);

    final generator = SettlementGenerator(settlementType, race);
    generator.seed((seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  SettlementType _getSettlementType(int seed, SettlementType? settlementType) {
    if (settlementType != null) {
      return settlementType;
    }

    final generator = _worldSettings.getSettlementTypeGenerator();
    generator.seed(seed);
    return generator.generate();
  }

  Race _generateRace(int seed) {
    final raceGenerator = ListItemGenerator(RaceManager.activeRaces);
    raceGenerator.seed(seed);
    return raceGenerator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
