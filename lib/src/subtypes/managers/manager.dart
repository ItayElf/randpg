/// The base class for subtypes managers.
///
/// It is advised that classes that extends this class would act like a singleton.
abstract class Manager<T> {
  const Manager();

  /// Returns all the types
  List<T> get allTypes;

  /// Returns all the active types
  List<T> get activeTypes;

  /// Returns a type based on a string
  T getType(String string);

  /// Registers [type] to all types and active types
  void registerType(T type);

  /// Removes [type] only from the active types
  void unregisterType(T type);

  /// Removes [type] from the active types and from all types lists
  void deleteType(T type);
}
