import '../../../enums/terrain.dart';
import '../world_map_settings.dart';

/// A setting that generates maps with almost no water and a lot of mountains and snow
class RockyWorldMapSettings implements WorldMapSettings {
  @override
  String getSettingName() => "flatlands";

  @override
  Terrain getTerrainFromHeight(double height) {
    if (height < -0.8) {
      return Terrain.sea;
    } else if (height < -0.6) {
      return Terrain.shore;
    } else if (height < -0.1) {
      return Terrain.grassland; // Limited shore
    } else if (height < 0.3) {
      return Terrain.hills; // Dominantly grassland
    } else if (height < 0.7) {
      return Terrain.mountains; // Few hills
    } else {
      return Terrain.snow; // Rare mountains
    }
  }
}
