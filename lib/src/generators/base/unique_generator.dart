import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates [_n] unique items from [_generator]
class UniqueGenerator<T> implements IGenerator<List<T>> {
  late int _seed;
  final IGenerator<T> _generator;
  final int _n;

  UniqueGenerator(this._generator, this._n) {
    _seed = SeedGenerator.generate();
  }

  /// Generates [_n] unique items from the generator [_generator]
  @override
  List<T> generate() {
    final List<T> returnValue = [];
    int tempSeed = _seed;

    while (returnValue.length < _n) {
      _generator.seed(tempSeed % SeedGenerator.maxSeed);

      final item = _generator.generate();
      if (!returnValue.contains(item)) {
        returnValue.add(item);
      }
      tempSeed = (tempSeed * tempSeed) + 1;
    }
    return returnValue;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
