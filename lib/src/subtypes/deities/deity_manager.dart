import 'package:collection/collection.dart';

import '../../randpg_exceptions.dart';
import 'deity_type.dart';
import 'gods/god.dart';

/// A class that handles the available deities and using them
///
/// When making a custom deity type, make sure to register it or else some features might not work
abstract class DeityManager {
  static final Set<DeityType> _deityTypes = {
    God(),
  };

  static final Set<DeityType> _activeDeityTypes = {..._deityTypes};

  /// Returns all the deity types
  static List<DeityType> get allLocations =>
      _deityTypes.toList()..sortBy((deityType) => deityType.getDeityType());

  /// Returns all active deities
  static List<DeityType> get activeDeityTypes => _activeDeityTypes.toList()
    ..sortBy((deityType) => deityType.getDeityType());

  /// Returns the corresponding deity type from all deities with type [type]
  static DeityType getDeityTypeByType(String type) {
    return _deityTypes.firstWhere(
      (deityType) => deityType.getDeityType() == type,
      orElse: () => throw DeityTypeNotFoundException(
          "DeityType with type $type was not found"),
    );
  }

  /// Adds [deityType] to the list of all deity types and active deity types
  static void registerDeityType(DeityType deityType) {
    _deityTypes.add(deityType);
    _activeDeityTypes.add(deityType);
  }

  /// Removes [deityType] only from the active races
  static void unregisterDeityType(DeityType deityType) {
    _activeDeityTypes.remove(getDeityTypeByType(deityType.getDeityType()));
  }

  /// Removes [deityType] from the active deity types and from all deity types list
  static void deleteDeityType(DeityType deityType) {
    final foundDeityType = getDeityTypeByType(deityType.getDeityType());
    _deityTypes.remove(foundDeityType);
    _activeDeityTypes.remove(foundDeityType);
  }
}
