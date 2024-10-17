import '../../../enums/terrain.dart';
import '../world_map_settings.dart';

/// A setting that generates maps with a lot of grasslands
class FlatlandsWorldMapSettings implements WorldMapSettings {
  @override
  String getSettingName() => "flatlands";

  @override
  Terrain getTerrainFromHeight(double height) {
    if (height < -0.7) {
      return Terrain.deepSea;
    } else if (height < -0.2) {
      return Terrain.sea;
    } else if (height < 0) {
      return Terrain.shore; // Limited shore
    } else if (height < 0.7) {
      return Terrain.grassland; // Dominantly grassland
    } else if (height < 0.9) {
      return Terrain.hills; // Few hills
    } else {
      return Terrain.mountains; // Rare mountains
    }
  }
}
