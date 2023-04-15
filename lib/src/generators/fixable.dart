/// A class that represent an object that needs to be fixed after generation

abstract class Fixable<T> {
  /// Returns the fixed version of [object]
  ///
  /// This method is called by the generator after generation and before returning the object.
  T getFixed(T object);
}
