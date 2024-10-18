import '../../../enums/terrain.dart';
import '../world_map_settings.dart';

/// A setting that generates normal worlds
class NormalWorldMapSettings implements WorldMapSettings {
  @override
  String getSettingName() => "normal";

  @override
  Terrain getTerrainFromHeight(double height) {
    if (height < -0.5) {
      return Terrain.deepSea;
    } else if (height < -0.2) {
      return Terrain.sea;
    } else if (height < -0.1) {
      return Terrain.shore;
    } else if (height < 0.3) {
      return Terrain.grassland;
    } else if (height < 0.5) {
      return Terrain.hills;
    } else if (height < 0.8) {
      return Terrain.mountains;
    } else {
      return Terrain.snow;
    }
  }
}
