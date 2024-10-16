import 'package:collection/collection.dart';

import '../../exceptions/not_found_exceptions.dart';
import '../managers/manager.dart';
import 'celebration/celebration.dart';
import 'holiday_type.dart';

/// A class that handles the available holidays and using them
///
/// When making a custom holiday type, make sure to register it or else some features might not work
class HolidayManager extends Manager<HolidayType> {
  const HolidayManager();

  static final Set<HolidayType> _holidaysTypes = {
    Celebration(),
  };

  static final Set<HolidayType> _activeHolidayTypes = {..._holidaysTypes};

  /// Returns all the holiday types
  @override
  List<HolidayType> get allTypes => _holidaysTypes.toList()
    ..sortBy((holidayType) => holidayType.getHolidayType());

  /// Returns all active holidays
  @override
  List<HolidayType> get activeTypes => _activeHolidayTypes.toList()
    ..sortBy((holidayType) => holidayType.getHolidayType());

  /// Returns the corresponding holiday type from all holidays with type [type]
  @override
  HolidayType getType(String type) {
    return _holidaysTypes.firstWhere(
      (holidayType) => holidayType.getHolidayType() == type,
      orElse: () => throw HolidayTypeNotFoundException(
          "HolidayType with type $type was not found"),
    );
  }

  /// Adds [holidayType] to the list of all holiday types and active holiday types
  @override
  void registerType(HolidayType holidayType) {
    _holidaysTypes.add(holidayType);
    _activeHolidayTypes.add(holidayType);
  }

  /// Removes [holidayType] only from the active holiday types
  @override
  void unregisterType(HolidayType holidayType) {
    _activeHolidayTypes.remove(getType(holidayType.getHolidayType()));
  }

  /// Removes [holidayType] from the active holiday types and from all holiday types list
  @override
  void deleteType(HolidayType holidayType) {
    final foundHolidayType = getType(holidayType.getHolidayType());
    _holidaysTypes.remove(foundHolidayType);
    _activeHolidayTypes.remove(foundHolidayType);
  }
}
