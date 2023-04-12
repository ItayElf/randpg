import '../../../entities/guilds/guilds.dart';
import '../../../subtypes/worlds/world_settings.dart';
import '../../base/generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/repeated_generator.dart';
import '../../base/seed_generator.dart';
import '../../guilds/guild_generator.dart';

/// A class that generates guilds for worlds
class WorldGuildsGenerator implements IGenerator<List<Guild>> {
  late int _seed;
  final WorldSettings _worldSettings;

  static const _numberOfGuilds = 2;

  WorldGuildsGenerator(this._worldSettings) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Guild> generate() {
    final guildTypesGenerator = RepeatedGenerator(
      _worldSettings.getGuildTypeGenerator(),
      _numberOfGuilds,
    );
    guildTypesGenerator.seed(_seed);
    final types = guildTypesGenerator.generate();

    final generator = ListBatchGenerator(
      types.map((guildType) => GuildGenerator(guildType)).toList(),
    );
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);

    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
