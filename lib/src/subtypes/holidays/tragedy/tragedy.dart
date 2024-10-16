import '../../../entities/holidays/holiday.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/fixable.dart';
import '../../../generators/holidays/celebrators/holiday_celebrators_generator.dart';
import '../../../generators/holidays/date/holiday_date_generator.dart';
import '../../../generators/holidays/duration/holiday_duration_generator.dart';
import '../holiday_type.dart';
import 'names/tragedy_name_generator.dart';
import 'names/tragedy_names_data.dart';
import 'origins/tragedy_origin_generator.dart';
import 'traditions/tragedy_tradition_generator.dart';

class Tragedy implements HolidayType, Fixable<Holiday> {
  static const _holidayType = "tragedy";

  @override
  Generator<String> getCelebratorsGenerator() => HolidayCelebratorGenerator();

  @override
  Generator<String> getDateGenerator() => HolidayDateGenerator();

  @override
  Generator<String> getDurationGenerator() => HolidayDurationGenerator();

  @override
  String getHolidayType() => _holidayType;

  @override
  Generator<String> getNameGenerator() => TragedyNameGenerator();

  @override
  Generator<String> getOriginGenerator() => TragedyOriginGenerator();

  @override
  Generator<String> getTraditionGenerator() => TragedyTraditionGenerator();

  @override
  Holiday getFixed(Holiday holiday) {
    for (final time in tragedyTime) {
      if (holiday.name.toLowerCase().contains(" $time")) {
        return holiday.copyWith(duration: "one $time");
      }
    }
    return holiday;
  }
}
