import '../../generators/base/generator.dart';

/// A class that represents a landscape type
abstract class LandscapeType {
  /// Returns a generator for the landscape name
  Generator<String> getNameGenerator();

  /// Returns a generator for the location of the landscape
  Generator<String> getLocationGenerator();

  /// Returns a generator for the weather in the landscape
  Generator<String> getWeatherGenerator();

  /// Returns the type of the landscape
  String getLandscapeType();

  /// Returns a generator for a feature of this landscape
  Generator<String> getFeatureGenerator();

  /// Returns a generator for a resource that can be found in this landscape
  Generator<String> getResourceGenerator();

  /// Returns a generator for something someone might encounter in this landscape
  Generator<String> getEncounterGenerator();

  /// Returns a generator for something this landscape is known for
  Generator<String> getKnownForGenerator();

  /// Returns a generator for this landscape's size
  Generator<String> getSizeGenerator();

  /// Returns a generator for how often people travel through this landscape
  Generator<String> getTravelRateGenerator();
}
