import '../../../entities/holidays/holiday.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/fixable.dart';
import '../../../generators/holidays/celebrators/holiday_celebrators_generator.dart';
import '../../../generators/holidays/date/holiday_date_generator.dart';
import '../../../generators/holidays/duration/holiday_duration_generator.dart';
import '../holiday_type.dart';
import 'names/celebration_name_data.dart';
import 'names/celebration_name_generator.dart';
import 'origins/celebration_origin_generator.dart';
import 'traditions/celebration_tradition_generator.dart';

class Celebration implements HolidayType, Fixable<Holiday> {
  static const _holidayType = "celebration";

  @override
  Generator<String> getCelebratorsGenerator() => HolidayCelebratorGenerator();

  @override
  Generator<String> getDateGenerator() => HolidayDateGenerator();

  @override
  Generator<String> getDurationGenerator() => HolidayDurationGenerator();

  @override
  String getHolidayType() => _holidayType;

  @override
  Generator<String> getNameGenerator() => CelebrationNameGenerator();

  @override
  Generator<String> getOriginGenerator() => CelebrationOriginGenerator();

  @override
  Generator<String> getTraditionGenerator() => CelebrationTraditionGenerator();

  @override
  Holiday getFixed(Holiday holiday) {
    for (final time in celebratoryTime) {
      if (holiday.name.toLowerCase().contains(" $time")) {
        return holiday.copyWith(duration: "one $time");
      }
    }
    return holiday;
  }
}
