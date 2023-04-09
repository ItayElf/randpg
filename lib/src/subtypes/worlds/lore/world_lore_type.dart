import '../../../generators/base/generator.dart';

/// A class that represents a world lore type
abstract class WorldLoreType {
  /// Returns the type of the lore (for backwards compatibility)
  String getLoreType();

  /// Returns a generator for something everybody knows
  IGenerator<String> getEverybodyKnowsGenerator();

  /// Returns a generator for something only few know
  IGenerator<String> getFewKnowGenerator();

  /// Returns a generator for something nobody knows
  IGenerator<String> getNobodyKnowsGenerator();

  /// Returns a generator for something peasants believe
  IGenerator<String> getPeasantsBelieveGenerator();

  /// Returns a generator for something the nobility believes
  IGenerator<String> getNobilityBelievesGenerator();

  /// Returns a generator for something the gods plan
  IGenerator<String> getGodsPlanGenerator();

  /// Returns a generator for something the gods fear
  IGenerator<String> getGodsFearGenerator();
}
