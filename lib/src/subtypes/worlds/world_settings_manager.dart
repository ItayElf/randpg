import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'default_settings/default_world_settings.dart';
import 'world_settings.dart';

/// A class that handles the available world settings and using them
///
/// When making a custom world settings, make sure to register it or else some features might not work
abstract class WorldSettingsManager {
  static final Set<WorldSettings> _worldSettingsPool = {
    DefaultWorldSettings(),
  };

  static final Set<WorldSettings> _activeWorldSettings = {
    ..._worldSettingsPool
  };

  /// Returns all the world settings
  static List<WorldSettings> get allWorldSettings => _worldSettingsPool.toList()
    ..sortBy((worldSettings) => worldSettings.getSettingName());

  /// Returns all active world settings
  static List<WorldSettings> get activeWorldSettings =>
      _activeWorldSettings.toList()
        ..sortBy((worldSettings) => worldSettings.getSettingName());

  /// Returns the corresponding world settings from all world settings from name [name]
  static WorldSettings getWorldSettingsByName(String name) {
    return _worldSettingsPool.firstWhere(
      (worldSettings) => worldSettings.getSettingName() == name,
      orElse: () => throw WorldSettingsNotFoundException(
          "WorldSettings with type $name was not found"),
    );
  }

  /// Adds [worldSettings] to the list of all world settings and active world settings
  static void registerWorldSettings(WorldSettings worldSettings) {
    _worldSettingsPool.add(worldSettings);
    _activeWorldSettings.add(worldSettings);
  }

  /// Removes [worldSettings] only from the active settings
  static void unregisterWorldSettings(WorldSettings worldSettings) {
    _activeWorldSettings
        .remove(getWorldSettingsByName(worldSettings.getSettingName()));
  }

  /// Removes [worldSettings] from the active world settings and from all world settings list
  static void deleteWorldSettings(WorldSettings worldSettings) {
    final foundWorldSettings =
        getWorldSettingsByName(worldSettings.getSettingName());
    _worldSettingsPool.remove(foundWorldSettings);
    _activeWorldSettings.remove(foundWorldSettings);
  }
}
