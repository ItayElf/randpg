import 'package:randpg/src/subtypes/locations/smithy/smithy.dart';

import '../../randpg_exceptions.dart';
import 'general_store/general_store.dart';
import 'location_type.dart';
import 'tavern/tavern.dart';

/// A class that handles the available locations and using them
///
/// When making a custom location, make sure to register it or else some features might not work
abstract class LocationManager {
  static final Set<LocationType> _locationTypes = {
    GeneralStore(),
    Tavern(),
    Smithy(),
  };

  static final Set<LocationType> _activeLocationTypes = {..._locationTypes};

  /// Returns all the location types
  static List<LocationType> get allLocations => _locationTypes.toList();

  /// Returns all active locations
  static List<LocationType> get activeLocationTypes =>
      _activeLocationTypes.toList();

  /// Returns the corresponding race from all races called [type]
  static LocationType getLocationTypeByType(String type) {
    return _locationTypes.firstWhere(
      (locationType) => locationType.getLocationType() == type,
      orElse: () => throw LocationTypeNotFoundException(
          "LocationType with type $type was not found"),
    );
  }

  /// Adds [locationType] to the list of all location types and active location types
  static void registerLocationType(LocationType locationType) {
    _locationTypes.add(locationType);
    _activeLocationTypes.add(locationType);
  }

  /// Removes [locationType] only from the active races
  static void unregisterLocationType(LocationType locationType) {
    _activeLocationTypes
        .remove(getLocationTypeByType(locationType.getLocationType()));
  }

  /// Removes [locationType] from the active location types and from all location types list
  static void deleteLocationType(LocationType locationType) {
    final foundRace = getLocationTypeByType(locationType.getLocationType());
    _locationTypes.remove(foundRace);
    _activeLocationTypes.remove(foundRace);
  }
}
