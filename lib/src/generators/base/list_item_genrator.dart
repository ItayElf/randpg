import 'dart:math';

import 'generator.dart';

class ListItemGenerator<T> implements IGenerator<T> {
  /// The list to generate an item from
  final List<T> _pool;

  /// The random object used for generation
  Random _random = Random();

  ListItemGenerator(this._pool);

  @override
  T generate() => _pool[_random.nextInt(_pool.length)];

  @override
  void seed(int seed) {
    _random = Random(seed);
  }
}
