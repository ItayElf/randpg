/// The base exception of the package
class RandpgException implements Exception {
  final String? msg;

  const RandpgException([this.msg]);

  @override
  String toString() => msg ?? "RandpgException";
}

/// An exception that is thrown when a not supported race is being used
class RaceNotSupportedException extends RandpgException {
  const RaceNotSupportedException([super.msg]);

  @override
  String toString() => msg ?? "RaceNotSupportedException";
}
