import 'generator.dart';
import 'list_item_genrator.dart';
import 'seed_generator.dart';

class MultipleGenerator<T> implements IGenerator<T> {
  /// A list of generators to generate from
  final List<IGenerator<T>> _pool;

  late int _seed;

  MultipleGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a value from one of the given generators
  @override
  T generate() {
    for (int i = 0; i < _pool.length; i++) {
      _pool[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return ListItemGenerator(_pool).generate().generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
