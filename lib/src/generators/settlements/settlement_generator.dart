import '../../entities/settlements/settlement.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/settlements/settlement_type.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart';
import '../base/generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../fixable.dart';
import 'important_characters/important_character_generator.dart';
import 'settlement_locations_generator.dart';

/// A class that generates settlements based on [_settlementType] and [_dominantRace]
class SettlementGenerator implements Generator<Settlement> {
  late int _seed;
  final SettlementType _settlementType;
  final Race? _dominantRace;

  SettlementGenerator(this._settlementType, this._dominantRace) {
    _seed = SeedGenerator.generate();
  }

  @override
  Settlement generate() {
    final nameGenerator = _settlementType.getNameGenerator(_dominantRace);
    nameGenerator.seed(_seed);
    final name = nameGenerator.generate();

    final generator = BatchGenerator(_getBatch(name));
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final results = generator.generate();
    Settlement settlement = Settlement.fromShallowMap(results);

    if (_settlementType is Fixable<Settlement>) {
      settlement = (_settlementType as Fixable).getFixed(settlement);
    }

    return settlement;
  }

  Map<String, Generator> _getBatch(String settlementName) => {
        "name": ConstantGenerator(settlementName),
        "settlementType": ConstantGenerator(_settlementType),
        "dominantRace": ConstantGenerator(_dominantRace),
        "description": _settlementType.getDescriptionGenerator(
          settlementName,
          _dominantRace,
        ),
        "dominantOccupation": _settlementType.getDominantOccupationGenerator(),
        "population": _settlementType.getPopulationGenerator(),
        "trouble": _settlementType.getTroubleGenerator(),
        "importantCharacters": UniqueGenerator(
          ImportantCharacterGenerator(
            _settlementType.getImportantOccupationGenerator(),
            _dominantRace,
          ),
          _settlementType.getImportantPeopleCount(),
        ),
        "locations": SettlementLocationsGenerator(
          _settlementType,
          _dominantRace,
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
