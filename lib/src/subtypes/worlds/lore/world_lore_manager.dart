import 'package:collection/collection.dart';

import '../../../exceptions/not_found_exceptions.dart';
import 'default_lore/default_lore.dart';
import 'world_lore_type.dart';

/// A class that handles the available worldLores and using them
///
/// When making a custom worldLore type, make sure to register it or else some features might not work
abstract class WorldLoreManager {
  static final Set<WorldLoreType> _worldLoreTypes = {
    DefaultLore(),
  };

  static final Set<WorldLoreType> _activeWorldLoreTypes = {..._worldLoreTypes};

  /// Returns all the worldLore types
  static List<WorldLoreType> get allWorldLores => _worldLoreTypes.toList()
    ..sortBy((worldLoreType) => worldLoreType.getLoreType());

  /// Returns all active worldLores
  static List<WorldLoreType> get activeWorldLoreTypes =>
      _activeWorldLoreTypes.toList()
        ..sortBy((worldLoreType) => worldLoreType.getLoreType());

  /// Returns the corresponding worldLore type from all worldLores from type [type]
  static WorldLoreType getWorldLoreTypeByType(String type) {
    return _worldLoreTypes.firstWhere(
      (worldLoreType) => worldLoreType.getLoreType() == type,
      orElse: () => throw WorldLoreTypeNotFoundException(
          "WorldLoreType with type $type was not found"),
    );
  }

  /// Adds [worldLoreType] to the list of all world lore types and active world lore types
  static void registerWorldLoreType(WorldLoreType worldLoreType) {
    _worldLoreTypes.add(worldLoreType);
    _activeWorldLoreTypes.add(worldLoreType);
  }

  /// Removes [worldLoreType] only from the active races
  static void unregisterWorldLoreType(WorldLoreType worldLoreType) {
    _activeWorldLoreTypes
        .remove(getWorldLoreTypeByType(worldLoreType.getLoreType()));
  }

  /// Removes [worldLoreType] from the active world lore types and from all world lore types list
  static void deleteWorldLoreType(WorldLoreType worldLoreType) {
    final foundWorldLoreType =
        getWorldLoreTypeByType(worldLoreType.getLoreType());
    _worldLoreTypes.remove(foundWorldLoreType);
    _activeWorldLoreTypes.remove(foundWorldLoreType);
  }
}
