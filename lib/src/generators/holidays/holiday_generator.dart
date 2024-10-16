import 'package:randpg/src/generators/base/unique_generator.dart';

import '../../entities/holidays/holiday.dart';
import '../../subtypes/holidays/holiday_type.dart';
import '../base/batch_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../fixable.dart';

/// A class that generates holidays
class HolidayGenerator implements Generator<Holiday> {
  late int _seed;
  final HolidayType _holidayType;

  static const _numberOfTraditions = 2;

  HolidayGenerator(this._holidayType) {
    _seed = SeedGenerator.generate();
  }

  @override
  Holiday generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    Holiday holiday = Holiday.fromMap(generator.generate());

    if (_holidayType is Fixable<Holiday>) {
      holiday = (_holidayType as Fixable).getFixed(holiday);
    }

    return holiday;
  }

  Map<String, Generator> _getBatch() => {
        "name": _holidayType.getNameGenerator(),
        "holidayType": ListItemGenerator([_holidayType]),
        "date": _holidayType.getDateGenerator(),
        "duration": _holidayType.getDurationGenerator(),
        "origin": _holidayType.getOriginGenerator(),
        "celebratedBy": _holidayType.getCelebratorsGenerator(),
        "traditions": UniqueGenerator(
          _holidayType.getTraditionGenerator(),
          _numberOfTraditions,
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
