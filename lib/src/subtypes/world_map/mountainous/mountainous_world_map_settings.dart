import '../../../enums/terrain.dart';
import '../world_map_settings.dart';

/// A setting that generates maps with many mountains
class MountainousWorldMapSettings implements WorldMapSettings {
  @override
  String getSettingName() => "mountainous";

  @override
  Terrain getTerrainFromHeight(double height) {
    if (height < -0.7) {
      return Terrain.deepSea;
    } else if (height < -0.3) {
      return Terrain.sea;
    } else if (height < 0) {
      return Terrain.shore;
    } else if (height < 0.3) {
      return Terrain.grassland;
    } else if (height < 0.6) {
      return Terrain.hills;
    } else if (height < 0.8) {
      return Terrain.mountains;
    } else {
      return Terrain.snow;
    }
  }
}
