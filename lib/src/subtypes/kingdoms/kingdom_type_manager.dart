import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'default_kingdom/default_kingdom_type.dart';
import 'kingdom_type.dart';

/// A class that handles the available kingdoms and using them
///
/// When making a custom kingdom type, make sure to register it or else some features might not work
class KingdomTypeManager extends Manager<KingdomType> {
  const KingdomTypeManager();

  static final Set<KingdomType> _kingdomTypes = {
    DefaultKingdomType(),
  };

  static final Set<KingdomType> _activeKingdomTypes = {..._kingdomTypes};

  /// Returns all the kingdom types
  @override
  List<KingdomType> get allTypes => _kingdomTypes.toList()
    ..sortBy((kingdomType) => kingdomType.getKingdomType());

  /// Returns all active kingdoms
  @override
  List<KingdomType> get activeTypes => _activeKingdomTypes.toList()
    ..sortBy((kingdomType) => kingdomType.getKingdomType());

  /// Returns the corresponding kingdom type from all kingdoms with type [type]
  @override
  KingdomType getType(String type) {
    return _kingdomTypes.firstWhere(
      (kingdomType) => kingdomType.getKingdomType() == type,
      orElse: () => throw KingdomTypeNotFoundException(
          "KingdomType with type $type was not found"),
    );
  }

  /// Adds [kingdomType] to the list of all kingdom types and active kingdom types
  @override
  void registerType(KingdomType kingdomType) {
    _kingdomTypes.add(kingdomType);
    _activeKingdomTypes.add(kingdomType);
  }

  /// Removes [kingdomType] only from the active races
  @override
  void unregisterType(KingdomType kingdomType) {
    _activeKingdomTypes.remove(getType(kingdomType.getKingdomType()));
  }

  /// Removes [kingdomType] from the active kingdom types and from all kingdom types list
  @override
  void deleteType(KingdomType kingdomType) {
    final foundKingdomType = getType(kingdomType.getKingdomType());
    _kingdomTypes.remove(foundKingdomType);
    _activeKingdomTypes.remove(foundKingdomType);
  }
}
