import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';
import 'base_description_generator.dart';
import 'building_description_data.dart';

/// A class that generates a description for two story buildings
class TwoStoryDescriptionGenerator implements Generator<String> {
  late int _seed;
  final String _locationType;
  final String _locationName;

  TwoStoryDescriptionGenerator(this._locationType, this._locationName) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BaseDescriptionGenerator(_locationType, _locationName);
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
        "The second floor boasts $floorStyle the first floor. It is $floorSize the first, $floorDescription.";

    return [
      description.first,
      secondFloor,
      ...description.sublist(1),
    ].join("\n");
  }

  Generator<String> _getFloorDescriptionGenerator(String floorSize) {
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
