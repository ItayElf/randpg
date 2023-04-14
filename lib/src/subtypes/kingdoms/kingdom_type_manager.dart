import 'package:collection/collection.dart';

import '../../randpg_exceptions.dart';
import 'kingdom_type.dart';

/// A class that handles the available kingdoms and using them
///
/// When making a custom kingdom type, make sure to register it or else some features might not work
abstract class KingdomTypeManager {
  static final Set<KingdomType> _kingdomTypes = {};

  static final Set<KingdomType> _activeKingdomTypes = {..._kingdomTypes};

  /// Returns all the kingdom types
  static List<KingdomType> get allLocations => _kingdomTypes.toList()
    ..sortBy((kingdomType) => kingdomType.getKingdomType());

  /// Returns all active kingdoms
  static List<KingdomType> get activeKingdomTypes =>
      _activeKingdomTypes.toList()
        ..sortBy((kingdomType) => kingdomType.getKingdomType());

  /// Returns the corresponding kingdom type from all kingdoms with type [type]
  static KingdomType getKingdomTypeByType(String type) {
    return _kingdomTypes.firstWhere(
      (kingdomType) => kingdomType.getKingdomType() == type,
      orElse: () => throw KingdomTypeNotFoundException(
          "KingdomType with type $type was not found"),
    );
  }

  /// Adds [kingdomType] to the list of all kingdom types and active kingdom types
  static void registerKingdomType(KingdomType kingdomType) {
    _kingdomTypes.add(kingdomType);
    _activeKingdomTypes.add(kingdomType);
  }

  /// Removes [kingdomType] only from the active races
  static void unregisterKingdomType(KingdomType kingdomType) {
    _activeKingdomTypes
        .remove(getKingdomTypeByType(kingdomType.getKingdomType()));
  }

  /// Removes [kingdomType] from the active kingdom types and from all kingdom types list
  static void deleteKingdomType(KingdomType kingdomType) {
    final foundKingdomType = getKingdomTypeByType(kingdomType.getKingdomType());
    _kingdomTypes.remove(foundKingdomType);
    _activeKingdomTypes.remove(foundKingdomType);
  }
}
