import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'desert/desert.dart';
import 'forest/forest.dart';
import 'landscape_type.dart';
import 'mountains/mountains.dart';
import 'ocean/ocean.dart';
import 'river/river.dart';
import 'steppe/steppe.dart';
import 'swamp/swamp.dart';
import 'tundra/tundra.dart';

/// A class that handles the available landscapes and using them
///
/// When making a custom landscape type, make sure to register it or else some features might not work
class LandscapeManager extends Manager<LandscapeType> {
  static final Set<LandscapeType> _landscapeTypes = {
    Forest(),
    Mountains(),
    Swamp(),
    River(),
    Desert(),
    Ocean(),
    Tundra(),
    Steppe(),
  };

  static final Set<LandscapeType> _activeLandscapeTypes = {..._landscapeTypes};

  /// Returns all the landscape types
  @override
  List<LandscapeType> get allTypes => _landscapeTypes.toList()
    ..sortBy((landscapeType) => landscapeType.getLandscapeType());

  /// Returns all active landscapes
  @override
  List<LandscapeType> get activeTypes => _activeLandscapeTypes.toList()
    ..sortBy((landscapeType) => landscapeType.getLandscapeType());

  /// Returns the corresponding landscape type from all landscapes with type [type]
  @override
  LandscapeType getType(String type) {
    return _landscapeTypes.firstWhere(
      (landscapeType) => landscapeType.getLandscapeType() == type,
      orElse: () => throw LandscapeTypeNotFoundException(
          "LandscapeType with type $type was not found"),
    );
  }

  /// Adds [landscapeType] to the list of all landscape types and active landscape types
  @override
  void registerType(LandscapeType landscapeType) {
    _landscapeTypes.add(landscapeType);
    _activeLandscapeTypes.add(landscapeType);
  }

  /// Removes [landscapeType] only from the active races
  @override
  void unregisterType(LandscapeType landscapeType) {
    _activeLandscapeTypes.remove(getType(landscapeType.getLandscapeType()));
  }

  /// Removes [landscapeType] from the active landscape types and from all landscape types list
  @override
  void deleteType(LandscapeType landscapeType) {
    final foundLandscapeType = getType(landscapeType.getLandscapeType());
    _landscapeTypes.remove(foundLandscapeType);
    _activeLandscapeTypes.remove(foundLandscapeType);
  }
}
