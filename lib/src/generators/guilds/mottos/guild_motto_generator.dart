import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'guild_motto_data.dart';

/// A class that generates guild mottos
class GuildMottoGenerator implements IGenerator<String> {
  late int _seed;

  static const _numberOfTraits = 2;

  GuildMottoGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final mapGenerator = BatchGenerator(_getBatch());
    mapGenerator.seed(_seed);
    final results = mapGenerator.generate();

    final generator = ListItemGenerator([
      _getBaseMotto(results),
      _getAlternativeMotto(results),
      _getAbstractMotto(results),
    ]);
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  String _getBaseMotto(Map<String, dynamic> map) =>
      "through ${map["traits"].join(" and ")}, we ${map["action"]} to ${map["goal"]}";

  String _getAlternativeMotto(Map<String, dynamic> map) =>
      "${map["action"]}ing with ${map["traits"].join(" and ")} for ${map["goal"].split(" ").first}ing ${map["goal"].split(" ").sublist(1).join(" ")}";

  String _getAbstractMotto(Map<String, dynamic> map) =>
      "${map["goal"].split(" ").first}ing ${map["goal"].split(" ").sublist(1).join(" ")} with ${map["traits"].join(" and ")}";

  Map<String, IGenerator> _getBatch() => {
        "traits": UniqueGenerator(
          ListItemGenerator(guildTraits),
          _numberOfTraits,
        ),
        "action": ListItemGenerator(guildAction),
        "goal": ListItemGenerator(guildGoals),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
