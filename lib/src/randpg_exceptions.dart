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
