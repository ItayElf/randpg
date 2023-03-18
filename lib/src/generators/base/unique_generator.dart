import 'generator.dart';
import 'list_item_generator.dart';
import 'seed_generator.dart';

/// A class that generates [n] unique items from [pool]
class UniqueGenerator<T> implements IGenerator<List<T>> {
  late int _seed;
  final List<T> _pool;
  final int _n;

  UniqueGenerator(this._pool, this._n) {
    _seed = SeedGenerator.generate();
  }

  /// Generates [n] unique items from [pool]
  @override
  List<T> generate() {
    final generator = ListItemGenerator(_pool);

    final List<T> returnValue = [];
    int counter = 0;
    while (returnValue.length < _n) {
      generator.seed(_seed + counter);

      final item = generator.generate();
      if (!returnValue.contains(item)) {
        returnValue.add(item);
      }
      counter++;
    }
    return returnValue;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
