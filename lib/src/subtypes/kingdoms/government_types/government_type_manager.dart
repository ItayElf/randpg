import 'package:collection/collection.dart';

import '../../../exceptions/not_found_exceptions.dart';
import '../../managers/manager.dart';
import 'federation/federation.dart';
import 'government_type.dart';
import 'monarchy/monarchy.dart';
import 'republic/republic.dart';
import 'theocracy/theocracy.dart';

/// A class that handles the available governmentTypes and using them
///
/// When making a custom governmentType, make sure to register it or else some features might not work
class GovernmentTypeManager extends Manager<GovernmentType> {
  const GovernmentTypeManager();

  static final Set<GovernmentType> _governmentTypes = {
    Federation(),
    Monarchy(),
    Republic(),
    Theocracy(),
  };

  static final Set<GovernmentType> _activeGovernmentTypes = {
    ..._governmentTypes
  };

  /// Returns all the governmentTypes
  @override
  List<GovernmentType> get allTypes => _governmentTypes.toList()
    ..sortBy((governmentType) => governmentType.getGovernmentType());

  /// Returns all active governmentTypes
  @override
  List<GovernmentType> get activeTypes => _activeGovernmentTypes.toList()
    ..sortBy((governmentType) => governmentType.getGovernmentType());

  /// Returns the corresponding governmentType from all governmentTypes called [name]
  @override
  GovernmentType getType(String name) {
    return _governmentTypes.firstWhere(
      (governmentType) => governmentType.getGovernmentType() == name,
      orElse: () => throw GovernmentTypeNotFoundException(
          "GovernmentType with name $name was not found"),
    );
  }

  /// Adds [governmentType] to the list of all governmentTypes and active governmentTypes
  @override
  void registerType(GovernmentType governmentType) {
    _governmentTypes.add(governmentType);
    _activeGovernmentTypes.add(governmentType);
  }

  /// Removes [governmentType] only from the active governmentTypes
  @override
  void unregisterType(GovernmentType governmentType) {
    _activeGovernmentTypes.remove(getType(governmentType.getGovernmentType()));
  }

  /// Removes [governmentType] from the active governmentTypes and from all governmentTypes lists
  @override
  void deleteType(GovernmentType governmentType) {
    final foundGovernmentType = getType(governmentType.getGovernmentType());
    _governmentTypes.remove(foundGovernmentType);
    _activeGovernmentTypes.remove(foundGovernmentType);
  }
}
