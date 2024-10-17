import 'package:image/image.dart';

import '../../entities/world_map/world_map.dart';
import '../../enums/terrain.dart';
import '../../subtypes/world_map/world_map_settings.dart';
import '../base/generator.dart';
import '../base/seed_generator.dart';
import 'perlin_map_generator.dart';

class WorldMapGenerator implements Generator<WorldMap> {
  late int _seed;
  final WorldMapSettings _settings;
  final int _width;
  final int _height;

  WorldMapGenerator(this._settings, this._width, this._height) {
    _seed = SeedGenerator.generate();
  }

  @override
  WorldMap generate() {
    final noiseGenerator = PerlinMapGenerator(_width, _height)..seed(_seed);
    final noise = _normalizeArray(noiseGenerator.generate());

    final image = Image(width: _width, height: _height);
    for (int x = 0; x < _width; x++) {
      for (int y = 0; y < _height; y++) {
        final terrain = _settings.getTerrainFromHeight(noise[y][x]);
        image.setPixel(
          x,
          y,
          _getColorFromTerrain(terrain),
        );
      }
    }

    return WorldMap(settings: _settings, image: image);
  }

  static List<List<double>> _normalizeArray(List<List<double>> array) {
    double minValue =
        array.expand((row) => row).reduce((a, b) => a < b ? a : b);
    double maxValue =
        array.expand((row) => row).reduce((a, b) => a > b ? a : b);
    double range = maxValue - minValue;
    return array.map((row) {
      return row.map((value) {
        return 2 * ((value - minValue) / range) - 1;
      }).toList();
    }).toList();
  }

  static ColorFloat16 _getColorFromTerrain(Terrain terrain) {
    switch (terrain) {
      case Terrain.deepSea:
        return ColorFloat16.rgb(0, 0, 128);
      case Terrain.sea:
        return ColorFloat16.rgb(0, 128, 255);
      case Terrain.shore:
        return ColorFloat16.rgb(255, 255, 0);
      case Terrain.grassland:
        return ColorFloat16.rgb(0, 255, 0);
      case Terrain.hills:
        return ColorFloat16.rgb(139, 69, 19);
      case Terrain.mountains:
        return ColorFloat16.rgb(128, 128, 128);
      case Terrain.snow:
        return ColorFloat16.rgb(255, 255, 255);
      default:
        return ColorFloat16.rgb(0, 0, 0);
    }
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
