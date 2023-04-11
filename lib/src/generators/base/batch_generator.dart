import 'generator.dart';
import 'seed_generator.dart';

/// A class that takes a map of labeled generators and returns the map with the generated values
class BatchGenerator implements IGenerator<Map<String, dynamic>> {
  late int _seed;
  final Map<String, IGenerator> _pool;

  BatchGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  /// Generates each generator in [_pool]
  @override
  Map<String, dynamic> generate() {
    final newPool = Map<String, IGenerator>.from(_pool);
    int tempSeed = _seed;

    for (final generator in newPool.values) {
      generator.seed(tempSeed % SeedGenerator.maxSeed);
      tempSeed = (tempSeed * tempSeed) + 1;
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
