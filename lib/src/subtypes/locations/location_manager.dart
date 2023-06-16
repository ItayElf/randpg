import 'package:collection/collection.dart';
import 'package:randpg/src/subtypes/managers/manager.dart';

import '../../exceptions/not_found_exceptions.dart';
import 'general_store/general_store.dart';
import 'library/library.dart';
import 'location_type.dart';
import 'monument/monument.dart';
import 'smithy/smithy.dart';
import 'tavern/tavern.dart';
import 'temple/temple.dart';

/// A class that handles the available locations and using them
///
/// When making a custom location type, make sure to register it or else some features might not work
class LocationManager extends Manager<LocationType> {
  static final Set<LocationType> _locationTypes = {
    GeneralStore(),
    Library(),
    Monument(),
    Smithy(),
    Tavern(),
    Temple(),
  };

  static final Set<LocationType> _activeLocationTypes = {..._locationTypes};

  /// Returns all the location types
  @override
  List<LocationType> get allTypes => _locationTypes.toList()
    ..sortBy((locationType) => locationType.getLocationType());

  /// Returns all active locations
  @override
  List<LocationType> get activeTypes => _activeLocationTypes.toList()
    ..sortBy((locationType) => locationType.getLocationType());

  /// Returns the corresponding location type from all locations with type [type]
  @override
  LocationType getType(String type) {
    return _locationTypes.firstWhere(
      (locationType) => locationType.getLocationType() == type,
      orElse: () => throw LocationTypeNotFoundException(
          "LocationType with type $type was not found"),
    );
  }

  /// Adds [locationType] to the list of all location types and active location types
  @override
  void registerType(LocationType locationType) {
    _locationTypes.add(locationType);
    _activeLocationTypes.add(locationType);
  }

  /// Removes [locationType] only from the active races
  @override
  void unregisterType(LocationType locationType) {
    _activeLocationTypes.remove(getType(locationType.getLocationType()));
  }

  /// Removes [locationType] from the active location types and from all location types list
  @override
  void deleteType(LocationType locationType) {
    final foundLocationType = getType(locationType.getLocationType());
    _locationTypes.remove(foundLocationType);
    _activeLocationTypes.remove(foundLocationType);
  }
}
