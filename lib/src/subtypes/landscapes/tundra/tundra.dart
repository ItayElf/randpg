import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/tundra_encounter_generator.dart';
import 'features/tundra_feature_generator.dart';
import 'resources/tundra_resources_generator.dart';
import 'size/tundra_size_generator.dart';
import 'weather/tundra_weather_generator.dart';

/// A class that represents the tundra landscape type
class Tundra implements LandscapeType {
  const Tundra();

  static const _landscapeType = "tundra";
  static const _landscapeTitles = [
    "tundra",
    "taiga",
    "wasteland",
    "plains",
  ];

  @override
  IGenerator<String> getEncounterGenerator() => TundraEncounterGenerator();

  @override
  IGenerator<String> getFeatureGenerator() => TundraFeatureGenerator();

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
  IGenerator<String> getResourceGenerator() => TundraResourceGenerator();

  @override
  IGenerator<String> getSizeGenerator() => TundraSizeGenerator();

  @override
  IGenerator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  IGenerator<String> getWeatherGenerator() => TundraWeatherGenerator();
}
