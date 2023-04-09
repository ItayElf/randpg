/// The base exception of the package
class RandpgException implements Exception {
  final String? msg;

  const RandpgException([this.msg]);

  @override
  String toString() => msg ?? "RandpgException";
}

/// An exception that is thrown when a not supported race is being used
class RaceNotFoundException extends RandpgException {
  const RaceNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "RaceNotFoundException";
}

/// An exception that is thrown when a not supported gender is being used
class GenderNotSupportedException extends RandpgException {
  const GenderNotSupportedException([super.msg]);

  @override
  String toString() => msg ?? "GenderNotSupportedException";
}

/// An exception that is thrown when a not supported locationType is being used
class LocationTypeNotFoundException extends RandpgException {
  const LocationTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "LocationTypeNotFoundException";
}

/// An exception that is thrown when a not supported settlementType is being used
class SettlementTypeNotFoundException extends RandpgException {
  const SettlementTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "SettlementTypeNotFoundException";
}

/// An exception that is thrown when a not supported landscapeType is being used
class LandscapeTypeNotFoundException extends RandpgException {
  const LandscapeTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "LandscapeTypeNotFoundException";
}

/// An exception that is thrown when a not supported deityType is being used
class DeityTypeNotFoundException extends RandpgException {
  const DeityTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "DeityTypeNotFoundException";
}

/// An exception that is thrown when a not supported loreType is being used
class WorldLoreTypeNotFoundException extends RandpgException {
  const WorldLoreTypeNotFoundException([super.msg]);

  @override
  String toString() => msg ?? "WorldLoreTypeNotFoundException";
}
