import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
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
  Generator<String> getEncounterGenerator() => RiverEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => RiverFeatureGenerator();

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
  Generator<String> getResourceGenerator() => RiverResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => RiverSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => RiverWeatherGenerator();
}
