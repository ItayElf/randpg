import '../../../strings_manipulations.dart';
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

    final name = titled(_settlementName);

    final looksTemplateGenerator = ListItemGenerator(_getLooks(name, results));
    looksTemplateGenerator.seed((_seed + 1) % SeedGenerator.maxSeed);
    final looksTemplate = looksTemplateGenerator.generate();

    final brief =
        "$name is ${results["look"]} $_settlementType. It ${results["place"]}.";

    final specialty =
        "$name is known for ${results["specialty"].join(", in addition to ")}. "
        "${titled(results["relationship"])}.";

    return [brief, looksTemplate, specialty].join("\n");
  }

  List<String> _getLooks(String name, Map<String, dynamic> results) {
    return [
      "Many buildings in $name have ${results["roof"]} rooftops, ${results["walls"]} walls "
          "and ${results["feature"]}, giving it ${results["atmosphere"]} atmosphere.",
      "${titled(results["roof"])} roofs is a common feature among the buildings in $name, "
          "along with ${results["walls"]} walls and ${results["feature"]}, all contributing to "
          "${results["atmosphere"]} atmosphere of the $_settlementType.",
      "With ${results["roof"]} roofs, ${results["walls"]} walls, and ${results["feature"]} as a prominent "
          "aspect of the town's architecture, $name has ${results["atmosphere"]} mood."
    ];
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
                  _dominantRace != null || !element.contains("<RACE>"))
              .toList()),
          (result) => result
              .replaceAll("<RACE>", _dominantRace?.getPluralName() ?? "")
              .replaceAll("<NAME>", titledEach(_settlementName)),
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
