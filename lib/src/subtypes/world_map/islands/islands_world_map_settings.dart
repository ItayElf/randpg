import '../../../enums/terrain.dart';
import '../world_map_settings.dart';

/// A setting that generates maps with many islands
class IslandsWorldMapSettings implements WorldMapSettings {
  @override
  String getSettingName() => "islands";

  @override
  Terrain getTerrainFromHeight(double height) {
    if (height < -0.3) {
      return Terrain.deepSea;
    } else if (height < 0.2) {
      return Terrain.sea;
    } else if (height < 0.3) {
      return Terrain.shore;
    } else if (height < 0.8) {
      return Terrain.grassland;
    } else if (height < 0.9) {
      return Terrain.hills;
    } else if (height < 0.975) {
      return Terrain.mountains;
    } else {
      return Terrain.snow;
    }
  }
}
