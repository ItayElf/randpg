import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/landscapes/known_for/landscape_known_for_generator.dart';
import '../../../generators/landscapes/location/landscape_location_generator.dart';
import '../../../generators/landscapes/names/landscape_adjective_name_generator.dart';
import '../../../generators/landscapes/names/landscape_generic_name_generator.dart';
import '../../../generators/landscapes/names/landscape_race_name_generator.dart';
import '../../../generators/landscapes/travel_rate/landscape_travel_rate_generator.dart';
import '../landscape_type.dart';
import '../tundra/features/tundra_feature_generator.dart';
import 'encounters/steppe_encounter_generator.dart';
import 'resources/steppe_resource_generator.dart';
import 'size/steppe_size_generator.dart';
import 'weather/steppe_weather_generator.dart';

/// A class that represents the steppe landscape type
class Steppe implements LandscapeType {
  const Steppe();

  static const _landscapeType = "steppe";
  static const _landscapeTitles = [
    "steppe",
    "grassland",
    "prairie",
    "plain",
  ];

  @override
  Generator<String> getEncounterGenerator() => SteppeEncounterGenerator();

  @override
  Generator<String> getFeatureGenerator() => TundraFeatureGenerator();

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
  Generator<String> getResourceGenerator() => SteppeResourceGenerator();

  @override
  Generator<String> getSizeGenerator() => SteppeSizeGenerator();

  @override
  Generator<String> getTravelRateGenerator() => LandscapeTravelRateGenerator();

  @override
  Generator<String> getWeatherGenerator() => SteppeWeatherGenerator();
}
