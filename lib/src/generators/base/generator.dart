/// An interface for generator objects
abstract class IGenerator<T> {
  /// Generates an item of type [T]
  T generate();

  /// Seeds the generator with a number
  void seed(int seed);
}
