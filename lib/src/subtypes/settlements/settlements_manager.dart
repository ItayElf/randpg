import '../../randpg_exceptions.dart';
import 'hamlet/hamlet.dart';
import 'settlement_type.dart';
import 'village/village.dart';

/// A class that handles the available settlements and using them
///
/// When making a custom settlement type, make sure to register it or else some features might not work
abstract class SettlementManager {
  static final Set<SettlementType> _settlementTypes = {
    Hamlet(),
    Village(),
  };

  static final Set<SettlementType> _activeSettlementTypes = {
    ..._settlementTypes
  };

  /// Returns all the settlement types
  static List<SettlementType> get allSettlements => _settlementTypes.toList();

  /// Returns all active settlements
  static List<SettlementType> get activeSettlementTypes =>
      _activeSettlementTypes.toList();

  /// Returns the corresponding settlement type from all races called [type]
  static SettlementType getSettlementTypeByType(String type) {
    return _settlementTypes.firstWhere(
      (settlementType) => settlementType.getSettlementType() == type,
      orElse: () => throw SettlementTypeNotFoundException(
          "SettlementType with type $type was not found"),
    );
  }

  /// Adds [settlementType] to the list of all location types and active location types
  static void registerSettlementType(SettlementType settlementType) {
    _settlementTypes.add(settlementType);
    _activeSettlementTypes.add(settlementType);
  }

  /// Removes [settlementType] only from the active races
  static void unregisterSettlementType(SettlementType settlementType) {
    _activeSettlementTypes
        .remove(getSettlementTypeByType(settlementType.getSettlementType()));
  }

  /// Removes [settlementType] from the active location types and from all location types list
  static void deleteSettlementType(SettlementType settlementType) {
    final foundSettlementType =
        getSettlementTypeByType(settlementType.getSettlementType());
    _settlementTypes.remove(foundSettlementType);
    _activeSettlementTypes.remove(foundSettlementType);
  }
}
