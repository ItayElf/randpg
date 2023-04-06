import '../../entities/landscapes/landscape.dart';
import '../../subtypes/landscapes/landscape_type.dart';
import '../base/batch_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';

/// A class that generates landscapes
class LandscapeGenerator implements IGenerator<Landscape> {
  late int _seed;
  final LandscapeType _landscapeType;

  static const _numberOfFeatures = 2;
  static const _numberOfResources = 2;
  static const _numberOfEncounters = 2;

  LandscapeGenerator(this._landscapeType) {
    _seed = SeedGenerator.generate();
  }

  @override
  Landscape generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    return Landscape.fromMap(generator.generate());
  }

  Map<String, IGenerator> _getBatch() => {
        "name": _landscapeType.getNameGenerator(),
        "location": _landscapeType.getLocationGenerator(),
        "weather": _landscapeType.getWeatherGenerator(),
        "landscapeType": ListItemGenerator([_landscapeType.getLandscapeType()]),
        "features": UniqueGenerator(
          _landscapeType.getFeatureGenerator(),
          _numberOfFeatures,
        ),
        "resources": UniqueGenerator(
          _landscapeType.getResourceGenerator(),
          _numberOfResources,
        ),
        "encounters": UniqueGenerator(
          _landscapeType.getEncounterGenerator(),
          _numberOfEncounters,
        ),
        "knownFor": _landscapeType.getKnownForGenerator(),
        "brief": _landscapeType.getBriefGenerator(),
        "size": _landscapeType.getSizeGenerator(),
        "travelRate": _landscapeType.getTravelRateGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
