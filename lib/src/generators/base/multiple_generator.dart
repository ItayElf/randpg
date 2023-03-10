import 'package:radnpg/src/generators/base/generator.dart';
import 'package:radnpg/src/generators/base/list_item_genrator.dart';
import 'package:radnpg/src/generators/base/seed_generator.dart';

class MultipleGenerator<T> implements IGenerator<T> {
  /// A list of generators to generate from
  final List<IGenerator<T>> pool;

  late int _seed;

  MultipleGenerator(this.pool) {
    _seed = SeedGenerator.generate();
  }

  @override
  T generate() {
    for (int i = 0; i < pool.length; i++) {
      pool[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return ListItemGenerator(pool).generate().generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
