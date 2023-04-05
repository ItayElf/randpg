import '../../../subtypes/races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'settlement_description_data.dart';

/// A class that generates settlements descriptions
class SettlementDescriptionGenerator implements IGenerator<String> {
  late int _seed;
  final String _settlementName;
  final Race? _dominantRace;
  final String _settlementType;

  static const _numberOfSpecials = 2;

  SettlementDescriptionGenerator(
    this._settlementName,
    this._dominantRace,
    this._settlementType,
  ) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final looks =
        "$_settlementName is ${results["look"]} $_settlementType. It ${results["place"]}. "
        "Many buildings in $_settlementName have ${results["roof"]} rooftops, "
        "${results["walls"]} walls and ${results["feature"]}, giving it ${results["atmosphere"]} atmosphere.";

    final specialty =
        "$_settlementName is known for ${results["specialty"].join(", in addition to ")}. "
        "${results["relationship"]}";

    return [looks, specialty].join("\n");
  }

  Map<String, IGenerator> _getBatch() => {
        "look": ListItemGenerator(settlementLook),
        "place": ListItemGenerator(settlementPlace),
        "roof": ListItemGenerator(settlementRoof),
        "walls": ListItemGenerator(settlementWalls),
        "feature": ListItemGenerator(settlementFeature),
        "atmosphere": ListItemGenerator(settlementAtmosphere),
        "specialty": UniqueGenerator(
            ListItemGenerator(settlementSpecialty), _numberOfSpecials),
        "relationship": FutureGenerator(
          ListItemGenerator(settlementRaceRelationship
              .where((element) =>
                  _dominantRace != null || !element.contains("<Race>"))
              .toList()),
          (result) => result
              .replaceAll("<RACE>", _dominantRace?.getPluralName() ?? "")
              .replaceAll("<TYPE>", _settlementType),
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
