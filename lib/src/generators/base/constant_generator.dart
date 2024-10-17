import 'generator.dart';

/// A class that generates a given constant value
class ConstantGenerator<T> implements Generator<T> {
  final T _value;

  const ConstantGenerator(this._value);

  @override
  T generate() {
    return _value;
  }

  @override
  // Seeding a constant generator makes no sense
  void seed(int seed) {}
}
