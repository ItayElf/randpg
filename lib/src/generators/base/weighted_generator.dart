import 'dart:math';

import 'package:radnpg/src/generators/base/generator.dart';

class WeightedGenerator<T> implements IGenerator<T> {
  /// A map containing the values with their respective probabilities as integers
  ///
  /// For example, a map {"a": 3, "b": 1} means "a" has a probability of 3/4 while "b" has a probability of 1/4
  final Map<T, int> pool;
  Random random = Random();

  WeightedGenerator(this.pool);

  @override
  T generate() {
    int sum = pool.values.toList().reduce((value, element) => value + element);
    int choice = random.nextInt(sum) + 1;
    print(choice);
    for (var pair in pool.entries) {
      if (choice <= pair.value) {
        return pair.key;
      }
      choice -= pair.value;
    }
    throw Exception(
        "Something went wrong while generating weighted pool $pool");
  }

  @override
  void seed(int seed) {
    random = Random(seed);
  }
}
