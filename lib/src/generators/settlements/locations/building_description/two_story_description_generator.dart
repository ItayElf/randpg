import 'package:randpg/generators/generators.dart';
import 'package:randpg/src/generators/settlements/locations/building_description/building_description_data.dart';

import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import 'base_description_generator.dart';

/// A class that generates a description for two story buildings
class TwoStoryDescriptionGenerator implements IGenerator<String> {
  late int _seed;

  TwoStoryDescriptionGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BaseDescriptionGenerator();
    generator.seed(_seed);
    final description = generator.generate().split("\n");

    final floorSizeGenerator = WeightedGenerator(secondFloorSize);
    floorSizeGenerator.seed(_seed);
    final floorSize = floorSizeGenerator.generate();

    final floorDescriptionGenerator = _getFloorDescriptionGenerator(floorSize);
    floorDescriptionGenerator.seed(_seed);
    final floorDescription = floorDescriptionGenerator.generate();

    final floorStyleGenerator = ListItemGenerator(secondFloorStyle);
    floorStyleGenerator.seed(_seed);
    final floorStyle = floorStyleGenerator.generate();

    final secondFloor =
        "the second floor is $floorSize, $floorDescription. this floor $floorStyle the floor below.";

    return [
      description.first,
      secondFloor,
      ...description.sublist(1),
    ].join("\n");
  }

  IGenerator<String> _getFloorDescriptionGenerator(String floorSize) {
    if (floorSize.contains("smaller")) {
      return ListItemGenerator(smallerFloorDescription);
    } else if (floorSize.contains("bigger")) {
      return ListItemGenerator(biggerFloorDescription);
    }
    return ListItemGenerator(sameSizeFloorDescription);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
