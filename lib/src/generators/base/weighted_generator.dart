import 'dart:math';

import 'generator.dart';

class WeightedGenerator<T> implements IGenerator<T> {
  /// A map containing the values with their respective probabilities as integers
  ///
  /// For example, a map {"a": 3, "b": 1} means "a" has a probability of 3/4 while "b" has a probability of 1/4
  final Map<T, int> _pool;
  Random _random = Random();

  WeightedGenerator(this._pool);

  /// Generates a value according to the given weights
  @override
  T generate() {
    int sum = _pool.values.toList().reduce((value, element) => value + element);
    int choice = _random.nextInt(sum) + 1;

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
    _random = Random(seed);
  }
}
