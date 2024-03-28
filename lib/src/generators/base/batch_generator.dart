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
  @override
  Map<String, dynamic> generate() {
    final newPool = Map<String, Generator>.from(_pool);

    int counter = 0;
    for (final generator in newPool.values) {
      generator.seed((_seed + counter * _seed) % SeedGenerator.maxSeed);
      counter++;
    }

    return Map<String, dynamic>.fromEntries(
      newPool.entries.map(
        (entry) => MapEntry(entry.key, entry.value.generate()),
      ),
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
