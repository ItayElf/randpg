import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/forest_encounter_generator.dart';
import 'features/forest_feature_generator.dart';
import 'resources/forest_resource_generator.dart';
import 'size/forest_size_generator.dart';
import 'weather/forest_weather_generator.dart';

/// A class that represents the forest location type
class Forest implements LandscapeType {
  const Forest();

  static const _landscapeType = "forest";
  static const _landscapeTitles = [
    "forest",
    "groves",
    "woods",
  ];

  @override
  Generator<String> getEncounterGenerator() => ForestEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => ForestFeatureGenerator();

  @override
  Generator<String> getKnownForGenerator() => LandscapeKnownForGenerator();

  @override
  String getLandscapeType() => _landscapeType;

  @override
  Generator<String> getLocationGenerator() => LandscapeLocationGenerator();

  @override
  Generator<String> getNameGenerator() => MultipleGenerator([
        LandscapeAdjectiveNameGenerator(_landscapeTitles),
        LandscapeRaceNameGenerator(_landscapeTitles),
        LandscapeGenericNameGenerator(),
      ]);

  @override
  Generator<String> getResourceGenerator() => ForestResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => ForestSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => ForestWeatherGenerator();
}
