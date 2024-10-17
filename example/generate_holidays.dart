import 'package:randpg/entities/holidays.dart';

void main() {
  // Generating each of the active holiday types
  for (HolidayType holidayType in HolidayManager().activeTypes) {
    // generates a random holiday with the given type
    Holiday holiday = HolidayGenerator(holidayType).generate();

    print(holiday.toJson());
  }
}
