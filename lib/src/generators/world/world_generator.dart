import '../../entities/world_map/world_map.dart';
import '../../entities/worlds/world.dart';
import '../../subtypes/holidays/holiday_type.dart';
import '../../subtypes/world_map/world_map_settings_manager.dart';
import '../../subtypes/worlds/world_settings.dart';
import '../base/batch_generator.dart';
import '../base/constant_generator.dart';
import '../base/generator.dart';
import '../base/list_batch_generator.dart';
import '../base/list_item_generator.dart';
import '../base/number_generator.dart';
import '../base/repeated_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../holidays/holiday_generator.dart';
import '../settlements/important_characters/important_character_generator.dart';
import '../world_map/world_map_generator.dart';
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
  static const _worldMapSize = 100;

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

    final worldMap = _generateWorldMap();

    final generator = BatchGenerator(_getBatch(holidayTypes, worldMap));
    generator.seed((_seed + 2) % SeedGenerator.maxSeed);
    return World.fromShallowMap(generator.generate());
  }

  /// This method tries to generate a map with tiles and if it fails generates one
  /// with plain pixels
  WorldMap _generateWorldMap() {
    final worldMapSettingsGenerator =
        ListItemGenerator(WorldMapSettingsManager().activeTypes)..seed(_seed);
    final settings = worldMapSettingsGenerator.generate();
    WorldMapGenerator worldMapGenerator;
    try {
      worldMapGenerator = WorldMapGenerator.withTiles(
          settings, 16 * _worldMapSize, 16 * _worldMapSize)
        ..seed(_seed);
      return worldMapGenerator.generate();
    } on UnimplementedError catch (_) {}
    worldMapGenerator = WorldMapGenerator(
      settings,
      _worldMapSize,
      _worldMapSize,
    )..seed(_seed);
    return worldMapGenerator.generate();
  }

  Map<String, Generator> _getBatch(
          List<HolidayType> holidayTypes, WorldMap worldMap) =>
      {
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
        "worldMap": ConstantGenerator(worldMap),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
