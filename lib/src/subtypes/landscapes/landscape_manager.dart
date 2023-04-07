import '../../randpg_exceptions.dart';
import 'forest/forest.dart';
import 'landscape_type.dart';
import 'mountains/mountains.dart';
import 'river/river.dart';
import 'swamp/swamp.dart';

/// A class that handles the available landscapes and using them
///
/// When making a custom landscape type, make sure to register it or else some features might not work
abstract class LandscapeManager {
  static final Set<LandscapeType> _landscapeTypes = {
    Forest(),
    Mountains(),
    Swamp(),
    River(),
  };

  static final Set<LandscapeType> _activeLandscapeTypes = {..._landscapeTypes};

  /// Returns all the landscape types
  static List<LandscapeType> get allLocations => _landscapeTypes.toList();

  /// Returns all active landscapes
  static List<LandscapeType> get activeLandscapeTypes =>
      _activeLandscapeTypes.toList();

  /// Returns the corresponding landscape type from all landscapes with type [type]
  static LandscapeType getLandscapeTypeByType(String type) {
    return _landscapeTypes.firstWhere(
      (landscapeType) => landscapeType.getLandscapeType() == type,
      orElse: () => throw LandscapeTypeNotFoundException(
          "LandscapeType with type $type was not found"),
    );
  }

  /// Adds [landscapeType] to the list of all landscape types and active landscape types
  static void registerLandscapeType(LandscapeType landscapeType) {
    _landscapeTypes.add(landscapeType);
    _activeLandscapeTypes.add(landscapeType);
  }

  /// Removes [landscapeType] only from the active races
  static void unregisterLandscapeType(LandscapeType landscapeType) {
    _activeLandscapeTypes
        .remove(getLandscapeTypeByType(landscapeType.getLandscapeType()));
  }

  /// Removes [landscapeType] from the active landscape types and from all landscape types list
  static void deleteLandscapeType(LandscapeType landscapeType) {
    final foundLandscapeType =
        getLandscapeTypeByType(landscapeType.getLandscapeType());
    _landscapeTypes.remove(foundLandscapeType);
    _activeLandscapeTypes.remove(foundLandscapeType);
  }
}
