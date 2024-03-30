import 'dart:math';

import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates random value based on a probability map
class WeightedGenerator<T> implements Generator<T> {
  late int _seed;

  /// A map containing the values with their respective probabilities as integers
  ///
  /// For example, a map {"a": 3, "b": 1} means "a" has a probability of 3/4 while "b" has a probability of 1/4
  final Map<T, int> _pool;

  WeightedGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a value according to the given weights
  @override
  T generate() {
    int sum = _pool.values.toList().reduce((value, element) => value + element);
    int choice = Random(_seed).nextInt(sum) + 1;

    for (var pair in _pool.entries) {
      if (choice <= pair.value) {
        return pair.key;
      }
      choice -= pair.value;
    }
    throw Exception(
        "Something went wrong while generating weighted pool $_pool");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
