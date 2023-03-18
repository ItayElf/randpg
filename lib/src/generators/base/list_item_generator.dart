import 'dart:math';

import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates a random item from a list
class ListItemGenerator<T> implements IGenerator<T> {
  late int _seed;
  final List<T> _pool;

  ListItemGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a random item from the list
  @override
  T generate() => _pool[Random(_seed).nextInt(_pool.length)];

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
