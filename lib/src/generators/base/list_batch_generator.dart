import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates a value from each of the given [_pool]
class ListBatchGenerator<T> implements Generator<List<T>> {
  late int _seed;
  final List<Generator<T>> _pool;

  ListBatchGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<T> generate() {
    for (int i = 0; i < _pool.length; i++) {
      _pool[i].seed((_seed + i * i) % SeedGenerator.maxSeed);
    }

    return _pool.map((generator) => generator.generate()).toList();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
