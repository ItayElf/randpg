import '../../../generators/base/future_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/occupation/simple_occupation_generator.dart';
import '../../../generators/settlements/description/settlement_description_generator.dart';
import '../../../generators/settlements/names/dominant_race_name_generator.dart';
import '../../../generators/settlements/names/objects_settlement_name_generator.dart';
import '../../../generators/settlements/occupations/settlement_occupations_generator.dart';
import '../../../generators/settlements/trouble/settlement_trouble_generator.dart';
import '../../locations/general_store/general_store.dart';
import '../../locations/location_manager.dart';
import '../../locations/location_type.dart';
import '../../locations/tavern/tavern.dart';
import '../../races/race.dart';
import '../settlement_type.dart';

/// A class that represents the village settlement type
class Village implements SettlementType {
  const Village();

  static const _settlementType = 'village';
  static const _importantPeopleCount = 2;
  static const _minPopulation = 500;
  static const _maxPopulation = 1000;
  static const _settlementLocations = [
    Tavern(),
    GeneralStore(),
    null,
  ];

  @override
  IGenerator<String> getDescriptionGenerator(
          String settlementName, Race? dominantRace) =>
      SettlementDescriptionGenerator(
        settlementName,
        dominantRace,
        _settlementType,
      );

  @override
  IGenerator<String> getDominantOccupationGenerator() =>
      SimpleOccupationGenerator();

  @override
  IGenerator<String> getImportantOccupationGenerator() =>
      SettlementOccupationsGenerator();

  @override
  int getImportantPeopleCount() => _importantPeopleCount;

  @override
  IGenerator<LocationType> getLocationsTypeGenerator() =>
      ListItemGenerator(LocationManager.activeLocationTypes);

  @override
  IGenerator<String> getNameGenerator(Race? dominantRace) => MultipleGenerator([
        ObjectSettlementNameGenerator(),
        DominantRaceNameGenerator(dominantRace),
      ]);

  @override
  IGenerator<int> getPopulationGenerator() => FutureGenerator(
        NumberGenerator(_minPopulation, _maxPopulation),
        (result) => result ~/ 10 * 10,
      );

  @override
  String getSettlementType() => _settlementType;

  @override
  List<LocationType?> getSettlementsLocations() => _settlementLocations;

  @override
  IGenerator<String> getTroubleGenerator() => SettlementTroubleGenerator();
}
