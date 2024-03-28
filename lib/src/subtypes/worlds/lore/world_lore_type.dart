import '../../../generators/base/generator.dart';

/// A class that represents a world lore type
abstract class WorldLoreType {
  /// Returns the type of the lore
  String getLoreType();

  /// Returns a generator for something everybody knows
  Generator<String> getEverybodyKnowsGenerator();

  /// Returns a generator for something only few know
  Generator<String> getFewKnowGenerator();

  /// Returns a generator for something nobody knows
  Generator<String> getNobodyKnowsGenerator();

  /// Returns a generator for something peasants believe
  Generator<String> getPeasantsBelieveGenerator();

  /// Returns a generator for something the nobility believes
  Generator<String> getNobilityBelievesGenerator();

  /// Returns a generator for something the gods plan
  Generator<String> getGodsPlanGenerator();

  /// Returns a generator for something the gods fear
  Generator<String> getGodsFearGenerator();
}
