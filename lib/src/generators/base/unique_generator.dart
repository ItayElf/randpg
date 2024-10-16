import '../../exceptions/base_exceptions.dart';
import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates [_n] unique items from [_generator]
class UniqueGenerator<T> implements Generator<List<T>> {
  late int _seed;
  final Generator<T> _generator;
  final int _n;

  static const _maxTries = 100;

  UniqueGenerator(this._generator, this._n) {
    _seed = SeedGenerator.generate();
  }

  /// Generates [_n] unique items from the generator [_generator]
  @override
  List<T> generate() {
    final Set<T> uniqueItems = {};
    int tempSeed = _seed;
    int counter = 0;

    while (uniqueItems.length < _n) {
      _generator.seed(tempSeed % SeedGenerator.maxSeed);

      final item = _generator.generate();
      // Returns false if the item is already inside the set
      if (uniqueItems.add(item)) {
        counter = 0;
      } else {
        counter++;
      }

      if (counter == _maxTries) {
        throw GeneratorException(
          "Unique generator could not generate $_n unique values from generator ${_generator.runtimeType}, "
          "probably due to lack of unique values.",
        );
      }

      tempSeed = (tempSeed * tempSeed) + 1;
      counter += 1;
    }
    return uniqueItems.toList();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
