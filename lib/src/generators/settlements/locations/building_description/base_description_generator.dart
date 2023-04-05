import '../../../../strings_manipulations.dart';
import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'building_description_data.dart';

/// A class that generates basic building description
class BaseDescriptionGenerator implements IGenerator<String> {
  late int _seed;
  final String _locationType;
  final String _locationName;

  BaseDescriptionGenerator(this._locationType, this._locationName) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    final results = generator.generate();

    final outerDescription =
        "${titledEach(_locationName)} presents a${results["feeling"]} appearance with its ${results["material"]} exterior. "
        "The ${results["windowSize"]}, ${results["windowShape"]} windows ${results["windowEffect"]}, which enhances its overall aesthetic. "
        "This $_locationType is ${results["shape"]}.";

    final roofDescription =
        "The ${results["roofShape"]} roof, covered in ${results["roofMaterials"]}, has ${results["chimneys"]}.";

    return [outerDescription, roofDescription].join("\n");
  }

  Map<String, IGenerator> _getBatch() => {
        "feeling": ListItemGenerator(buildingFeeling),
        "material": ListItemGenerator(buildingMaterial),
        "windowSize": ListItemGenerator(windowsSize),
        "windowShape": ListItemGenerator(windowsShape),
        "windowEffect": ListItemGenerator(windowsEffect),
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
