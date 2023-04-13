import '../../../entities/landscapes/landscape.dart';
import '../../../subtypes/landscapes/landscape_type.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../landscapes/landscape_generator.dart';

/// A class that generates landscapes for worlds
class WorldLandscapeGenerator implements IGenerator<List<Landscape>> {
  late int _seed;
  final WorldSettings _worldSettings;

  WorldLandscapeGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Landscape> generate() {
    final landscapes = _worldSettings.getLandscapeTypes();
    final landscapeTypes = List.generate(
      landscapes.length,
      (index) => _getLandscapeType(
        (_seed + index) % SeedGenerator.maxSeed,
        landscapes[index],
      ),
    );

    return List.generate(
      landscapeTypes.length,
      (index) => _generateLandscape(
        (_seed + index) % SeedGenerator.maxSeed,
        landscapeTypes[index],
      ),
    );
  }

  Landscape _generateLandscape(int seed, LandscapeType landscapeType) {
    final generator = LandscapeGenerator(landscapeType);
    generator.seed((seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  LandscapeType _getLandscapeType(int seed, LandscapeType? landscapeType) {
    if (landscapeType != null) {
      return landscapeType;
    }

    final generator = _worldSettings.getLandscapeTypeGenerator();
    generator.seed(seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
