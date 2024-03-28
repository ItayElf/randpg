import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'companion_type.dart';

/// A class that handles the available deities and using them
///
/// When making a custom deity type, make sure to register it or else some features might not work
class CompanionManager extends Manager<CompanionType> {
  const CompanionManager();

  static final Set<CompanionType> _companionTypes = {};

  static final Set<CompanionType> _activeCompanionTypes = {..._companionTypes};

  /// Returns all the companion types
  @override
  List<CompanionType> get allTypes => _companionTypes.toList()
    ..sortBy((companionType) => companionType.getCompanionType());

  /// Returns all the active companion types
  @override
  List<CompanionType> get activeTypes => _activeCompanionTypes.toList()
    ..sortBy((companionType) => companionType.getCompanionType());

  /// Returns the corresponding companion type from all companions with type [type]
  @override
  CompanionType getType(String type) {
    return _companionTypes.firstWhere(
      (companionType) => companionType.getCompanionType() == type,
      orElse: () => throw CompanionTypeNotFoundException(
          "CompanionType with type $type was not found"),
    );
  }

  /// Adds [companionType] to the list of all deity types and active companions types
  @override
  void registerType(CompanionType companionType) {
    _companionTypes.add(companionType);
    _activeCompanionTypes.add(companionType);
  }

  /// Removes [companionType] only from the active races
  @override
  void unregisterType(CompanionType companionType) {
    _activeCompanionTypes.remove(getType(companionType.getCompanionType()));
  }

  /// Removes [companionType] from the active deity types and from all deity types list
  @override
  void deleteType(CompanionType companionType) {
    final foundDeityType = getType(companionType.getCompanionType());
    _companionTypes.remove(foundDeityType);
    _activeCompanionTypes.remove(foundDeityType);
  }
}
