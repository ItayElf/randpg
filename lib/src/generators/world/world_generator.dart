import '../../entities/worlds/world.dart';
import '../../subtypes/worlds/world_settings.dart';
import '../base/batch_generator.dart';
import '../base/future_generator.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../base/unique_generator.dart';
import '../settlements/important_characters/important_character_generator.dart';
import 'guilds/world_guilds_generator.dart';
import 'landscapes/world_landscapes_generator.dart';
import 'lore/world_lore_generator.dart';
import 'opinions/world_opinions_generator.dart';
import 'settlements/world_settlements_generator.dart';

/// A class that generates worlds
class WorldGenerator implements IGenerator<World> {
  late int _seed;
  final WorldSettings _worldSettings;

  WorldGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  World generate() {
    final generator = BatchGenerator(_getBatch());
    generator.seed(_seed);
    return World.fromMap(generator.generate());
  }

  Map<String, IGenerator> _getBatch() => {
        "name": _worldSettings.getNameGenerator(),
        "worldSettings": ListItemGenerator([_worldSettings.getSettingName()]),
        "kingdoms": FutureGenerator(
          WorldKingdomsGenerator(_worldSettings),
          (kingdoms) => kingdoms.map((e) => e.toMap()).toList(),
        ),
        "landscapes": FutureGenerator(
          WorldLandscapeGenerator(_worldSettings),
          (landscapes) => landscapes.map((e) => e.toMap()).toList(),
        ),
        "opinions": FutureGenerator(
          WorldOpinionsGenerator(),
          (map) => map.map(
            (key, value) => MapEntry(key.getName(), value),
          ),
        ),
        "importantPeople": FutureGenerator(
          UniqueGenerator(
            ImportantCharacterGenerator(
              _worldSettings.getImportantOccupationGenerator(),
              null,
            ),
            _worldSettings.getImportantPeopleCount(),
          ),
          (people) => people.map((e) => e.toMap()).toList(),
        ),
        "guilds": FutureGenerator(
          WorldGuildsGenerator(_worldSettings),
          (guilds) => guilds.map((e) => e.toMap()).toList(),
        ),
        "deities": FutureGenerator(
          _worldSettings.getDeitiesGenerator(),
          (deities) => deities.map((e) => e.toMap()).toList(),
        ),
        "lesserDeities": FutureGenerator(
          _worldSettings.getLesserDeitiesGenerator(),
          (deities) => deities.map((e) => e.toMap()).toList(),
        ),
        "higherDeities": FutureGenerator(
          _worldSettings.getHigherDeitiesGenerator(),
          (deities) => deities.map((e) => e.toMap()).toList(),
        ),
        "worldLore": FutureGenerator(
          WorldLoreGenerator(_worldSettings.getWorldLore()),
          (lore) => lore.toMap(),
        ),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
