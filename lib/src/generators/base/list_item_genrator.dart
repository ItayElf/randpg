import 'dart:math';

import 'generator.dart';

class ListItemGenerator<T> implements IGenerator {
  /// The list to generate an item from
  final List<T> pool;

  /// The random object used for generation
  Random random = Random();

  ListItemGenerator(this.pool);

  @override
  T generate() => pool[random.nextInt(pool.length)];

  @override
  void seed(int seed) {
    random = Random(seed);
  }
}
