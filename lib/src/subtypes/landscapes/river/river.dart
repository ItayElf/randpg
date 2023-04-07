import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/river_encounter_generator.dart';
import 'features/river_feature_generator.dart';
import 'resources/river_resources_generator.dart';
import 'size/river_size_generator.dart';
import 'weather/river_weather_generator.dart';

/// A class that represents the river landscape type
class River implements LandscapeType {
  const River();

  static const _landscapeType = "river";
  static const _landscapeTitles = [
    "river",
    "brook",
    "delta",
  ];

  @override
  IGenerator<String> getEncounterGenerator() => RiverEncounterGenerator();

  @override
  IGenerator<String> getFeatureGenerator() => RiverFeatureGenerator();

  @override
  IGenerator<String> getKnownForGenerator() => LandscapeKnownForGenerator();

  @override
  String getLandscapeType() => _landscapeType;

  @override
  IGenerator<String> getLocationGenerator() => LandscapeLocationGenerator();

  @override
  IGenerator<String> getNameGenerator() => MultipleGenerator([
        LandscapeAdjectiveNameGenerator(_landscapeTitles),
        LandscapeRaceNameGenerator(_landscapeTitles),
      ]);

  @override
  IGenerator<String> getResourceGenerator() => RiverResourceGenerator();

  @override
  IGenerator<String> getSizeGenerator() => RiverSizeGenerator();

  @override
  IGenerator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  IGenerator<String> getWeatherGenerator() => RiverWeatherGenerator();
}
