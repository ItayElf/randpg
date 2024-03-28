import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/ocean_encounter_generator.dart';
import 'features/ocean_feature_generator.dart';
import 'resources/ocean_resource_generator.dart';
import 'size/ocean_size_generator.dart';
import 'weather/ocean_weather_generator.dart';

/// A class that represents the ocean landscape type
class Ocean implements LandscapeType {
  const Ocean();

  static const _landscapeType = "ocean";
  static const _landscapeTitles = [
    "ocean",
    "sea",
    "waters",
  ];

  @override
  Generator<String> getEncounterGenerator() => OceanEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => OceanFeatureGenerator();

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
  Generator<String> getResourceGenerator() => OceanResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => OceanSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => OceanWeatherGenerator();
}
