import '../../generators/base/generator.dart';

/// An interface that allows races to export custom settlement names
abstract class SettlementNameable {
  /// Returns a generator for custom settlement names
  IGenerator<String> getSettlementNameGenerator();
}
