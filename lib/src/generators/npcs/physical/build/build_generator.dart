import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'build_data.dart';

/// A class that generates a build from a given race
class BuildGenerator implements IGenerator<String> {
  late int _seed;
  final Race _race;

  BuildGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    List<String> pool = List.from(genericBuild);
    for (var entry in buildMap.entries) {
      if (entry.key.contains(_race)) {
        pool = List.from(entry.value);
      }
    }

    final generator = ListItemGenerator(pool);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
