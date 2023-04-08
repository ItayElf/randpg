import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/swamp_encounter_generator.dart';
import 'features/swamp_feature_generator.dart';
import 'resources/swamp_resource_generator.dart';
import 'size/swamp_size_generator.dart';
import 'weather/swamp_weather_generator.dart';

/// A class that represents the swamp landscape type
class Swamp implements LandscapeType {
  const Swamp();

  static const _landscapeType = "swamp";
  static const _landscapeTitles = [
    "swamp",
    "marsh",
    "bog",
    "wetland",
    "mire",
  ];

  @override
  IGenerator<String> getEncounterGenerator() => SwampEncounterGenerator();

  @override
  IGenerator<String> getFeatureGenerator() => SwampFeatureGenerator();

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
        LandscapeGenericNameGenerator(),
      ]);

  @override
  IGenerator<String> getResourceGenerator() => SwampResourceGenerator();

  @override
  IGenerator<String> getSizeGenerator() => SwampSizeGenerator();

  @override
  IGenerator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  IGenerator<String> getWeatherGenerator() => SwampWeatherGenerator();
}
