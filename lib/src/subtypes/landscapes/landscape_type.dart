import '../../generators/base/generator.dart';

/// A class that represents a landscape type
abstract class LandscapeType {
  /// Returns a generator for the landscape name
  IGenerator<String> getNameGenerator();

  /// Returns a generator for the location of the landscape
  IGenerator<String> getLocationGenerator();

  /// Returns a generator for the weather in the landscape
  IGenerator<String> getWeatherGenerator();

  /// Returns the type of the landscape
  String getLandscapeType();

  /// Returns a generator for a feature of this landscape
  IGenerator<String> getFeatureGenerator();

  /// Returns a generator for a resource that can be found in this landscape
  IGenerator<String> getResourceGenerator();

  /// Returns a generator for something someone might encounter in this landscape
  IGenerator<String> getEncounterGenerator();

  /// Returns a generator for something this landscape is known for
  IGenerator<String> getKnownForGenerator();

  /// Returns a generator for a short description of this landscape
  IGenerator<String> getBriefGenerator();

  /// Returns a generator for this landscape's size
  IGenerator<String> getSizeGenerator();

  /// Returns a generator for how often people travel through this landscape
  IGenerator<String> getTravelRateGenerator();
}
