import 'generator.dart';
import 'seed_generator.dart';

/// A class that generates a value from [_generator] and calls [_onGenerate] on it and returns the value
class FutureGenerator<T> implements IGenerator<T> {
  late int _seed;
  final IGenerator<T> _generator;
  final T Function(T) _onGenerate;

  FutureGenerator(this._generator, this._onGenerate) {
    _seed = SeedGenerator.generate();
  }

  @override
  T generate() {
    _generator.seed(_seed);
    return _onGenerate(_generator.generate());
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
