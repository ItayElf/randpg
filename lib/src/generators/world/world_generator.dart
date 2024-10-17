import '../../entities/worlds/world.dart';
import '../../subtypes/holidays/holiday_type.dart';
import '../../subtypes/worlds/world_settings.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart';
import '../base/generator.dart';
import '../base/list_batch_generator.dart';
import '../base/number_generator.dart';
import '../base/repeated_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../holidays/holiday_generator.dart';
import '../settlements/important_characters/important_character_generator.dart';
import 'guilds/world_guilds_generator.dart';
import 'landscapes/world_landscapes_generator.dart';
import 'lore/world_lore_generator.dart';
import 'opinions/world_opinions_generator.dart';
import 'kingdoms/world_kingdoms_generator.dart';

/// A class that generates worlds
class WorldGenerator implements Generator<World> {
  late int _seed;
  final WorldSettings _worldSettings;

  static const _minNumberOfHolidays = 2;
  static const _maxNumberOfHolidays = 4;

  WorldGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  World generate() {
    final numberOfHolidaysGenerator =
        NumberGenerator(_minNumberOfHolidays, _maxNumberOfHolidays)
          ..seed(_seed);
    final holidayTypesGenerator = RepeatedGenerator(
      _worldSettings.getHolidayTypeGenerator(),
      numberOfHolidaysGenerator.generate(),
    )..seed((_seed + 1) % SeedGenerator.maxSeed);
    final holidayTypes = holidayTypesGenerator.generate();

    final generator = BatchGenerator(_getBatch(holidayTypes));
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return World.fromShallowMap(generator.generate());
  }

  Map<String, Generator> _getBatch(List<HolidayType> holidayTypes) => {
        "name": _worldSettings.getNameGenerator(),
        "worldSettings": ConstantGenerator(_worldSettings),
        "kingdoms": WorldKingdomsGenerator(_worldSettings),
        "landscapes": WorldLandscapeGenerator(_worldSettings),
        "opinions": WorldOpinionsGenerator(),
        "importantPeople": UniqueGenerator(
          ImportantCharacterGenerator(
            _worldSettings.getImportantOccupationGenerator(),
            null,
          ),
          _worldSettings.getImportantPeopleCount(),
        ),
        "guilds": WorldGuildsGenerator(_worldSettings),
        "deities": _worldSettings.getDeitiesGenerator(),
        "lesserDeities": _worldSettings.getLesserDeitiesGenerator(),
        "higherDeities": _worldSettings.getHigherDeitiesGenerator(),
        "worldLore": WorldLoreGenerator(_worldSettings.getWorldLore()),
        "holidays": ListBatchGenerator(
          holidayTypes.map((x) => HolidayGenerator(x)).toList(),
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
