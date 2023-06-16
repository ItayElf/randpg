import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'archangels/archangel.dart';
import 'deity_type.dart';
import 'demigods/demigod.dart';
import 'demon_lords/demon_lord.dart';
import 'gods/god.dart';
import 'primordials/primordial.dart';

/// A class that handles the available deities and using them
///
/// When making a custom deity type, make sure to register it or else some features might not work
class DeityManager extends Manager<DeityType> {
  static final Set<DeityType> _deityTypes = {
    God(),
    Demigod(),
    DemonLord(),
    Archangel(),
    Primordial(),
  };

  static final Set<DeityType> _activeDeityTypes = {..._deityTypes};

  /// Returns all the deity types
  @override
  List<DeityType> get allTypes =>
      _deityTypes.toList()..sortBy((deityType) => deityType.getDeityType());

  /// Returns all active deities
  @override
  List<DeityType> get activeTypes => _activeDeityTypes.toList()
    ..sortBy((deityType) => deityType.getDeityType());

  /// Returns the corresponding deity type from all deities with type [type]
  @override
  DeityType getType(String type) {
    return _deityTypes.firstWhere(
      (deityType) => deityType.getDeityType() == type,
      orElse: () => throw DeityTypeNotFoundException(
          "DeityType with type $type was not found"),
    );
  }

  /// Adds [deityType] to the list of all deity types and active deity types
  @override
  void registerType(DeityType deityType) {
    _deityTypes.add(deityType);
    _activeDeityTypes.add(deityType);
  }

  /// Removes [deityType] only from the active races
  @override
  void unregisterType(DeityType deityType) {
    _activeDeityTypes.remove(getType(deityType.getDeityType()));
  }

  /// Removes [deityType] from the active deity types and from all deity types list
  @override
  void deleteType(DeityType deityType) {
    final foundDeityType = getType(deityType.getDeityType());
    _deityTypes.remove(foundDeityType);
    _activeDeityTypes.remove(foundDeityType);
  }
}
