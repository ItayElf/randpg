import '../../../strings_manipulations.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'guild_history_data.dart';

/// A class that generates guild histories
class GuildHistoryGenerator implements IGenerator<String> {
  late int _seed;
  final String _guildType;
  final String _guildName;

  static const _numberOfChallenges = 2;

  GuildHistoryGenerator(this._guildType, this._guildName) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final mapGenerator = BatchGenerator(_getBatch());
    mapGenerator.seed(_seed);
    final results = mapGenerator.generate();

    final generator = ListItemGenerator([
      _getBaseHistory(results),
      _getAlternativeHistory(results),
    ]);
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  String _getBaseHistory(Map<String, dynamic> map) =>
      "${titledEach(_guildName)} is ${article(_guildType)} founded ${map["time"]} ago."
      "Over the years, they've faced challenges such as ${map["challenges"].join(" and ")}, "
      "but they remain ${map["quality"]}. Today, ${titledEach(_guildName)} is ${article(map["importance"])} part of society.";

  String _getAlternativeHistory(Map<String, dynamic> map) =>
      "Established ${map["time"]} ago, ${titledEach(_guildName)} is ${article(_guildType)} "
      "that has encountered challenges like ${map["challenges"].join(" and ")}. "
      "Nevertheless, they persists to be ${map["quality"]}. Currently, ${titledEach(_guildName)} plays an ${article(map["importance"])} role in society.";

  Map<String, IGenerator> _getBatch() => {
        "time": ListItemGenerator(guildFoundTime),
        "challenges": UniqueGenerator(
          ListItemGenerator(guildChallenges),
          _numberOfChallenges,
        ),
        "quality": ListItemGenerator(guildQualities),
        "importance": ListItemGenerator(guildImportance),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
