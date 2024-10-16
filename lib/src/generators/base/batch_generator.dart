import 'generator.dart';
import 'seed_generator.dart';

/// A class that takes a map of labeled generators and returns the map with the generated values
class BatchGenerator implements Generator<Map<String, dynamic>> {
  late int _seed;
  final Map<String, Generator> _pool;

  BatchGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates each generator in [_pool]
  ///
  /// NOTE: this seeds the given generators
  @override
  Map<String, dynamic> generate() {
    final generatedValues = <String, dynamic>{};
    int currentSeed = _seed;

    int counter = 0;
    for (final entry in _pool.entries) {
      final generator = entry.value;
      generator.seed((currentSeed + counter * _seed) % SeedGenerator.maxSeed);
      generatedValues[entry.key] = generator.generate();
      counter++;
    }

    return generatedValues;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
