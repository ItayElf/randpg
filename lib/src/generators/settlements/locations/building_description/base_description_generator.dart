import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'building_description_data.dart';

/// A class that generates basic building description
class BaseDescriptionGenerator implements IGenerator<String> {
  late int _seed;

  BaseDescriptionGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final outerDescription =
        "looks ${results["felling"]} from outside. it was build with ${results["material"]}. "
        "${results["windowSize"]}, ${results["windowShape"]} windows ${results["windowsEffect"]} "
        "and were added to the building ${results["windowsArrangement"]}.";

    final roofDescription =
        "the roof is ${results["roofShape"]} and is covered with ${results["roofMaterials"]}. ${results["chimneys"]}";

    return [outerDescription, roofDescription].join("\n");
  }

  Map<String, IGenerator> _getBatch() => {
        "feeling": ListItemGenerator(buildingFeeling),
        "material": ListItemGenerator(buildingMaterial),
        "windowSize": ListItemGenerator(windowsSize),
        "windowShape": ListItemGenerator(windowsShape),
        "windowEffect": ListItemGenerator(windowsEffect),
        "windowsArrangement": ListItemGenerator(windowsArrangement),
        "shape": ListItemGenerator(buildingShape),
        "roofShape": ListItemGenerator(roofShape),
        "roofMaterials": ListItemGenerator(roofMaterials),
        "chimneys": ListItemGenerator(chimneys),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
