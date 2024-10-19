import 'generator.dart';
import 'list_item_generator.dart';
import 'seed_generator.dart';

/// A class that generates one value from multiple generators
class MultipleGenerator<T> implements Generator<T> {
  late int _seed;
  final List<Generator<T>> _pool;

  MultipleGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a value from one of the given generators
  @override
  T generate() {
    for (int i = 0; i < _pool.length; i++) {
      _pool[i].seed((_seed + i * i) % SeedGenerator.maxSeed);
    }
    final listGenerator = ListItemGenerator(_pool)..seed(_seed);
    return listGenerator.generate().generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
