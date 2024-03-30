import '../../../entities/guilds/guilds.dart';
import '../../../subtypes/guilds/guild_type.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../guilds/guild_generator.dart';

/// Generates a guild for a kingdom
class KingdomGuildGenerator implements Generator<Guild> {
  late int _seed;
  final Generator<GuildType> _guildTypeGenerator;

  KingdomGuildGenerator(this._guildTypeGenerator) {
    _seed = SeedGenerator.generate();
  }

  @override
  Guild generate() {
    _guildTypeGenerator.seed(_seed);
    final type = _guildTypeGenerator.generate();

    final generator = GuildGenerator(type);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
