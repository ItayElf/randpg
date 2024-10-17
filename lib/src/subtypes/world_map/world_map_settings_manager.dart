import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'world_map_settings.dart';

/// A class that handles the available world map settings and using them
///
/// When making a custom world map settings, make sure to register it or else some features might not work
class WorldMapSettingsManager extends Manager<WorldMapSettings> {
  const WorldMapSettingsManager();

  static final Set<WorldMapSettings> _worldMapSettingsPool = {};

  static final Set<WorldMapSettings> _activeWorldMapSettings = {
    ..._worldMapSettingsPool
  };

  /// Returns all the world map settings
  @override
  List<WorldMapSettings> get allTypes => _worldMapSettingsPool.toList()
    ..sortBy((worldMapSettings) => worldMapSettings.getSettingName());

  /// Returns all active world map settings
  @override
  List<WorldMapSettings> get activeTypes => _activeWorldMapSettings.toList()
    ..sortBy((worldMapSettings) => worldMapSettings.getSettingName());

  /// Returns the corresponding world map settings from all world map settings from name [name]
  @override
  WorldMapSettings getType(String name) {
    return _worldMapSettingsPool.firstWhere(
      (worldMapSettings) => worldMapSettings.getSettingName() == name,
      orElse: () => throw WorldMapSettingsNotFoundException(
          "WorldMapSettings with type $name was not found"),
    );
  }

  /// Adds [worldMapSettings] to the list of all world map settings and active world map settings
  @override
  void registerType(WorldMapSettings worldMapSettings) {
    _worldMapSettingsPool.add(worldMapSettings);
    _activeWorldMapSettings.add(worldMapSettings);
  }

  /// Removes [worldMapSettings] only from the active settings
  @override
  void unregisterType(WorldMapSettings worldMapSettings) {
    _activeWorldMapSettings.remove(getType(worldMapSettings.getSettingName()));
  }

  /// Removes [worldMapSettings] from the active world map settings and from all world map settings list
  @override
  void deleteType(WorldMapSettings worldMapSettings) {
    final foundWorldMapSettings = getType(worldMapSettings.getSettingName());
    _worldMapSettingsPool.remove(foundWorldMapSettings);
    _activeWorldMapSettings.remove(foundWorldMapSettings);
  }
}
