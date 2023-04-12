import 'package:randpg/src/generators/base/generator.dart';
import 'package:randpg/src/generators/base/seed_generator.dart';

/// A class that generates [_count] items from [_generator]
class RepeatedGenerator<T> implements IGenerator<List<T>> {
  late int _seed;
  final IGenerator<T> _generator;
  final int _count;

  RepeatedGenerator(this._generator, this._count) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<T> generate() {
    return List.generate(
      _count,
      (index) {
        _generator.seed((_seed + index * _seed) % SeedGenerator.maxSeed);
        return _generator.generate();
      },
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
