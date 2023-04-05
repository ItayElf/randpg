import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates a value from each of the given [_pool]
class ListBatchGenerator<T> implements IGenerator<List<T>> {
  late int _seed;
  final List<IGenerator<T>> _pool;

  ListBatchGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<T> generate() {
    List<IGenerator<T>> generators = List.from(_pool);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }

    return generators.map((generator) => generator.generate()).toList();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
