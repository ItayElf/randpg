import 'package:collection/collection.dart';

import '../../randpg_exceptions.dart';
import 'government_type.dart';

/// A class that handles the available governmentTypes and using them
///
/// When making a custom governmentType, make sure to register it or else some features might not work
abstract class GovernmentTypeManager {
  static final Set<GovernmentType> _governmentTypes = {};

  static final Set<GovernmentType> _activeGovernmentTypes = {
    ..._governmentTypes
  };

  /// Returns all the governmentTypes
  static List<GovernmentType> get allGovernmentTypes =>
      _governmentTypes.toList()
        ..sortBy((governmentType) => governmentType.getGovernmentType());

  /// Returns all active governmentTypes
  static List<GovernmentType> get activeGovernmentTypes =>
      _activeGovernmentTypes.toList()
        ..sortBy((governmentType) => governmentType.getGovernmentType());

  /// Returns the corresponding governmentType from all governmentTypes called [name]
  static GovernmentType getGovernmentTypeByType(String name) {
    return _governmentTypes.firstWhere(
      (governmentType) => governmentType.getGovernmentType() == name,
      orElse: () => throw GovernmentTypeNotFoundException(
          "GovernmentType with name $name was not found"),
    );
  }

  /// Adds [governmentType] to the list of all governmentTypes and active governmentTypes
  static void registerGovernmentType(GovernmentType governmentType) {
    _governmentTypes.add(governmentType);
    _activeGovernmentTypes.add(governmentType);
  }

  /// Removes [governmentType] only from the active governmentTypes
  static void unregisterGovernmentType(GovernmentType governmentType) {
    _activeGovernmentTypes
        .remove(getGovernmentTypeByType(governmentType.getGovernmentType()));
  }

  /// Removes [governmentType] from the active governmentTypes and from all governmentTypes lists
  static void deleteGovernmentType(GovernmentType governmentType) {
    final foundGovernmentType =
        getGovernmentTypeByType(governmentType.getGovernmentType());
    _governmentTypes.remove(foundGovernmentType);
    _activeGovernmentTypes.remove(foundGovernmentType);
  }
}
