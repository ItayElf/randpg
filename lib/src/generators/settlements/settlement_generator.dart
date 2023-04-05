import '../../../generators/generators.dart';
import '../../entities/npcs/npc.dart';
import '../../entities/settlements/location.dart';
import '../../entities/settlements/settlement.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/settlements/settlement_type.dart';
import 'important_characters/important_character_generator.dart';
import 'settlement_locations_generator.dart';

class SettlementGenerator implements IGenerator<Settlement> {
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

    results["importantCharacters"] =
        (results["importantCharacters"] as List<Npc>).map((e) => e.toMap());

    results["locations"] =
        (results["locations"] as List<Location>).map((e) => e.toMap());

    return Settlement.fromMap(results);
  }

  Map<String, IGenerator> _getBatch(String settlementName) => {
        "name": ListItemGenerator([settlementName]),
        "settlementType": ListItemGenerator([_settlementType]),
        "dominantRace": ListItemGenerator([_dominantRace]),
        "description": _settlementType.getDescriptionGenerator(
            settlementName, _dominantRace),
        "dominantOccupation": _settlementType.getDominantOccupationGenerator(),
        "population": _settlementType.getPopulationGenerator(),
        "trouble": _settlementType.getTroubleGenerator(),
        "importantCharacters": UniqueGenerator(
          ImportantCharacterGenerator(_settlementType, _dominantRace),
          _settlementType.getImportantPeopleCount(),
        ),
        "locations":
            SettlementLocationsGenerator(_settlementType, _dominantRace),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
