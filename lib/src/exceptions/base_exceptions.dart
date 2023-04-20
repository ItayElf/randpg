/// The base exception of the package
class RandpgException implements Exception {
  final String? msg;

  const RandpgException([this.msg]);

  @override
  String toString() => msg ?? "RandpgException";
}

/// An exception that is thrown when there is an error while generating
class GeneratorException extends RandpgException {
  const GeneratorException([super.msg]);

  @override
  String toString() => msg ?? "GeneratorException";
}
