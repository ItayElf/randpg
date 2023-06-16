import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'city/city.dart';
import 'hamlet/hamlet.dart';
import 'metropolis/metropolis.dart';
import 'settlement_type.dart';
import 'town/town.dart';
import 'village/village.dart';

/// A class that handles the available settlements and using them
///
/// When making a custom settlement type, make sure to register it or else some features might not work
class SettlementManager extends Manager<SettlementType> {
  const SettlementManager();

  static final Set<SettlementType> _settlementTypes = {
    Hamlet(),
    Village(),
    Town(),
    City(),
    Metropolis(),
  };

  static final Set<SettlementType> _activeSettlementTypes = {
    ..._settlementTypes
  };

  /// Returns all the settlement types
  @override
  List<SettlementType> get allTypes => _settlementTypes.toList()
    ..sortBy((settlementType) => settlementType.getSettlementType());

  /// Returns all active settlements
  @override
  List<SettlementType> get activeTypes => _activeSettlementTypes.toList()
    ..sortBy((settlementType) => settlementType.getSettlementType());

  /// Returns the corresponding settlement type from all settlements from type [type]
  @override
  SettlementType getType(String type) {
    return _settlementTypes.firstWhere(
      (settlementType) => settlementType.getSettlementType() == type,
      orElse: () => throw SettlementTypeNotFoundException(
          "SettlementType with type $type was not found"),
    );
  }

  /// Adds [settlementType] to the list of all location types and active location types
  @override
  void registerType(SettlementType settlementType) {
    _settlementTypes.add(settlementType);
    _activeSettlementTypes.add(settlementType);
  }

  /// Removes [settlementType] only from the active races
  @override
  void unregisterType(SettlementType settlementType) {
    _activeSettlementTypes.remove(getType(settlementType.getSettlementType()));
  }

  /// Removes [settlementType] from the active location types and from all location types list
  @override
  void deleteType(SettlementType settlementType) {
    final foundSettlementType = getType(settlementType.getSettlementType());
    _settlementTypes.remove(foundSettlementType);
    _activeSettlementTypes.remove(foundSettlementType);
  }
}
