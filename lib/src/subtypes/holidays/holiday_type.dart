import '../../generators/base/generator.dart';

/// A class that represents a holiday type
abstract class HolidayType {
  /// Returns a generator for a holiday name
  Generator<String> getNameGenerator();

  /// Returns the type of the holiday
  String getHolidayType();

  /// Returns a generator for a holiday's date
  Generator<String> getDateGenerator();

  /// Returns a generator for a holiday's duration
  Generator<String> getDurationGenerator();

  /// Returns a generator for a holiday's origin
  Generator<String> getOriginGenerator();

  /// Returns a generator for who celebrates this holiday
  Generator<String> getCelebratorsGenerator();

  /// Returns a generator for traditions of the holiday
  Generator<List<String>> getTraditionsGenerator();
}
