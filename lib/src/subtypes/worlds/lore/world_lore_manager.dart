import 'package:collection/collection.dart';

import '../../../exceptions/not_found_exceptions.dart';
import '../../managers/manager.dart';
import 'default_lore/default_lore.dart';
import 'world_lore_type.dart';

/// A class that handles the available worldLores and using them
///
/// When making a custom worldLore type, make sure to register it or else some features might not work
class WorldLoreManager extends Manager<WorldLoreType> {
  const WorldLoreManager();

  static final Set<WorldLoreType> _worldLoreTypes = {
    DefaultLore(),
  };

  static final Set<WorldLoreType> _activeWorldLoreTypes = {..._worldLoreTypes};

  /// Returns all the worldLore types
  @override
  List<WorldLoreType> get allTypes => _worldLoreTypes.toList()
    ..sortBy((worldLoreType) => worldLoreType.getLoreType());

  /// Returns all active worldLores
  @override
  List<WorldLoreType> get activeTypes => _activeWorldLoreTypes.toList()
    ..sortBy((worldLoreType) => worldLoreType.getLoreType());

  /// Returns the corresponding worldLore type from all worldLores from type [type]
  @override
  WorldLoreType getType(String type) {
    return _worldLoreTypes.firstWhere(
      (worldLoreType) => worldLoreType.getLoreType() == type,
      orElse: () => throw WorldLoreTypeNotFoundException(
          "WorldLoreType with type $type was not found"),
    );
  }

  /// Adds [worldLoreType] to the list of all world lore types and active world lore types
  @override
  void registerType(WorldLoreType worldLoreType) {
    _worldLoreTypes.add(worldLoreType);
    _activeWorldLoreTypes.add(worldLoreType);
  }

  /// Removes [worldLoreType] only from the active races
  @override
  void unregisterType(WorldLoreType worldLoreType) {
    _activeWorldLoreTypes.remove(getType(worldLoreType.getLoreType()));
  }

  /// Removes [worldLoreType] from the active world lore types and from all world lore types list
  @override
  void deleteType(WorldLoreType worldLoreType) {
    final foundWorldLoreType = getType(worldLoreType.getLoreType());
    _worldLoreTypes.remove(foundWorldLoreType);
    _activeWorldLoreTypes.remove(foundWorldLoreType);
  }
}
