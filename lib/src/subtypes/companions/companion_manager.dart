import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'birds/bird.dart';
import 'cats/cat.dart';
import 'companion_type.dart';
import 'dogs/dog.dart';
import 'imps/imp.dart';

/// A class that handles the available companions and using them
///
/// When making a custom companion type, make sure to register it or else some features might not work
class CompanionManager extends Manager<CompanionType> {
  const CompanionManager();

  static final Set<CompanionType> _companionTypes = {
    Dog(),
    Cat(),
    Bird(),
    Imp(),
  };

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

  /// Adds [companionType] to the list of all companion types and active companions types
  @override
  void registerType(CompanionType companionType) {
    _companionTypes.add(companionType);
    _activeCompanionTypes.add(companionType);
  }

  /// Removes [companionType] only from the active companions
  @override
  void unregisterType(CompanionType companionType) {
    _activeCompanionTypes.remove(getType(companionType.getCompanionType()));
  }

  /// Removes [companionType] from the active companion types and from all companions types list
  @override
  void deleteType(CompanionType companionType) {
    final foundDeityType = getType(companionType.getCompanionType());
    _companionTypes.remove(foundDeityType);
    _activeCompanionTypes.remove(foundDeityType);
  }
}
