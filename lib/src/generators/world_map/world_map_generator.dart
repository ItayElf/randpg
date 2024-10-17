import 'package:collection/collection.dart';
import 'package:image/image.dart';

import '../../entities/world_map/world_map.dart';
import '../../enums/terrain.dart';
import '../../subtypes/world_map/world_map_settings.dart';
import '../base/generator.dart';
import '../base/seed_generator.dart';
import 'perlin_map_generator.dart';
import 'world_map_tiles_data.dart';

/// A class that generates world maps
class WorldMapGenerator implements Generator<WorldMap> {
  late int _seed;
  final WorldMapSettings _settings;
  final int _width;
  final int _height;
  bool _useTiles = false;

  static const _tileSize = 16;

  WorldMapGenerator(this._settings, this._width, this._height) {
    _seed = SeedGenerator.generate();
  }

  /// NOTE: This feature is experimental and might not work
  factory WorldMapGenerator.withTiles(
      WorldMapSettings settings, int width, int height) {
    if (width % _tileSize != 0 || height % _tileSize != 0) {
      throw ArgumentError(
          "Width and height must be divisible by $_tileSize when using tiles");
    }
    final generator = WorldMapGenerator(settings, width, height);
    generator._useTiles = true;
    return generator;
  }

  @override
  WorldMap generate() {
    if (_useTiles) return _generateWithTiles();
    return _generatePixels();
  }

  WorldMap _generateWithTiles() {
    final noiseGenerator =
        PerlinMapGenerator(_width ~/ _tileSize + 1, _height ~/ _tileSize + 1)
          ..seed(_seed);
    final noise = _normalizeArray(noiseGenerator.generate());
    final terrainMap = List.generate(
      _width ~/ _tileSize + 1,
      (x) => List.generate(
        _height ~/ _tileSize + 1,
        (y) => _settings.getTerrainFromHeight(noise[y][x]),
      ),
    );
    final image = Image(width: _width, height: _height);
    for (int x = 0; x < _width ~/ _tileSize; x++) {
      for (int y = 0; y < _height ~/ _tileSize; y++) {
        final matchingImage = _getMatchingImage(x, y, terrainMap);
        _putImage(image, matchingImage, x * _tileSize, y * _tileSize);
      }
    }

    return WorldMap(settings: _settings, image: image);
  }

  WorldMap _generatePixels() {
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

  static Image _getMatchingImage(int x, int y, List<List<Terrain>> terrains) {
    final pattern = [
      terrains[y][x],
      terrains[y][x + 1],
      terrains[y + 1][x],
      terrains[y + 1][x + 1],
    ];
    final listEquals = const DeepCollectionEquality().equals;

    for (final key in patternToTile.keys) {
      if (listEquals(pattern, key)) {
        return patternToTile[key]!;
      }
    }
    throw UnimplementedError("Unimplemented pattern: $pattern");
  }

  static void _putImage(Image target, Image stamp, int x, int y) {
    for (int stampY = 0; stampY < stamp.height; stampY++) {
      for (int stampX = 0; stampX < stamp.width; stampX++) {
        Pixel stampPixel = stamp.getPixel(stampX, stampY);
        target.setPixel(x + stampX, y + stampY, stampPixel);
      }
    }
  }

  static ColorFloat16 _getColorFromTerrain(Terrain terrain) {
    switch (terrain) {
      case Terrain.deepSea:
        return ColorFloat16.rgb(4, 160, 180);
      case Terrain.sea:
        return ColorFloat16.rgb(43, 196, 169);
      case Terrain.shore:
        return ColorFloat16.rgb(201, 178, 102);
      case Terrain.grassland:
        return ColorFloat16.rgb(133, 166, 67);
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
