import '../../../strings_manipulations.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'kingdom_history_data.dart';

/// A class that generates histories for kingdoms
class KingdomHistoryGenerator implements Generator<String> {
  late int _seed;
  final String _kingdomName;

  KingdomHistoryGenerator(this._kingdomName) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final mapGenerator = BatchGenerator(_getBatch());
    mapGenerator.seed(_seed);
    final results = mapGenerator.generate();

    final generator = ListItemGenerator([
      _getHistory(results),
      _getAlternativeFormatHistory(results),
    ]);
    generator.seed((_seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  String _getHistory(Map<String, dynamic> map) =>
      "${titledEach(_kingdomName)} is ${article(map["age"])} kingdom that rose to power through ${map["rise"]}.\n"
      "${titledEach(_kingdomName)} faced ${map["challenge"]}, which ${map["result"]}.\n"
      "Today, ${titledEach(_kingdomName)} is ${map["state"]}.";

  String _getAlternativeFormatHistory(Map<String, dynamic> map) =>
      "Having risen to prominence through ${map["rise"]}, ${titledEach(_kingdomName)}, ${article(map["age"])} "
      "kingdom, was confronted by ${map["challenge"]}, which ${map["result"]}.\n"
      "Currently, ${titledEach(_kingdomName)} is ${map["state"]}";

  Map<String, Generator> _getBatch() => {
        "age": ListItemGenerator(kingdomAge),
        "rise": ListItemGenerator(kingdomRise),
        "challenge": ListItemGenerator(kingdomChallenge),
        "result": ListItemGenerator(kingdomChallengeResults),
        "state": ListItemGenerator(kingdomState),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
