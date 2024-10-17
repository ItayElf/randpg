import 'package:randpg/src/enums/terrain.dart';

abstract class WorldMapSettings {
  /// Returns the name of the setting
  String getSettingName();

  /// Returns the correct terrain type based on the height.
  /// Height is between -1 and 1
  Terrain getTerrainFromHeight(double height);
}
