import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/mountains_encounter_generator.dart';
import 'features/mountain_feature_generator.dart';
import 'resources/mountain_resource_generator.dart';
import 'size/mountain_size_generator.dart';
import 'weather/mountain_weather_generator.dart';

/// A class that represents the mountains landscape type
class Mountains implements LandscapeType {
  const Mountains();

  static const _landscapeType = "mountains";
  static const _landscapeTitles = [
    "mountains",
    "peaks",
    "ridge",
    "plateau",
    "summits"
  ];

  @override
  Generator<String> getEncounterGenerator() => MountainEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => MountainFeatureGenerator();

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
      ]);

  @override
  Generator<String> getResourceGenerator() => MountainResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => MountainSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => MountainsWeatherGenerator();
}
