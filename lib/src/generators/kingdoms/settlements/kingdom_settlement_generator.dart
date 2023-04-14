import '../../../entities/settlements/settlement.dart';
import '../../../subtypes/races/race.dart';
import '../../../subtypes/settlements/settlement_type.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../settlements/settlement_generator.dart';

/// Generates a settlement for a kingdom
class KingdomSettlementGenerator implements IGenerator<Settlement> {
  late int _seed;
  final IGenerator<SettlementType> _settlementTypeGenerator;
  final Race _race;

  KingdomSettlementGenerator(this._settlementTypeGenerator, this._race) {
    _seed = SeedGenerator.generate();
  }

  @override
  Settlement generate() {
    _settlementTypeGenerator.seed(_seed);
    final type = _settlementTypeGenerator.generate();

    final generator = SettlementGenerator(type, _race);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
