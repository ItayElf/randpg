import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import 'encounters/desert_encounter_generator.dart';
import 'features/desert_feature_generator.dart';
import 'resources/desert_resource_generator.dart';
import 'size/desert_size_generator.dart';
import 'weather/desert_weather_generator.dart';

/// A class that represents the desert landscape type
class Desert implements LandscapeType {
  const Desert();

  static const _landscapeType = "desert";
  static const _landscapeTitles = [
    "desert",
    "dunes",
  ];
  static const _adjectiveLandscapeTitles = [
    ..._landscapeTitles,
    "wasteland",
    "dryland"
  ];

  @override
  Generator<String> getEncounterGenerator() => DesertEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => DesertFeatureGenerator();

  @override
  Generator<String> getKnownForGenerator() => LandscapeKnownForGenerator();

  @override
  String getLandscapeType() => _landscapeType;

  @override
  Generator<String> getLocationGenerator() => LandscapeLocationGenerator();

  @override
  Generator<String> getNameGenerator() => MultipleGenerator([
        LandscapeAdjectiveNameGenerator(_adjectiveLandscapeTitles),
        LandscapeRaceNameGenerator(_landscapeTitles),
        LandscapeGenericNameGenerator(),
      ]);

  @override
  Generator<String> getResourceGenerator() => DesertResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => DesertSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => DesertWeatherGenerator();
}
