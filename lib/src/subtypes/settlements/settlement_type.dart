import '../../generators/base/generator.dart';
import '../locations/location_type.dart';
import '../races/race.dart';

/// A class that represents an abstract settlement type
abstract class SettlementType {
  /// Returns the name of the town
  Generator<String> getNameGenerator(Race? dominantRace);

  /// Returns the settlement type
  String getSettlementType();

  /// Returns the settlements locations, when null means a random type
  ///
  /// For example, the following list: `[Tavern(), GeneralShop(), null, null]` means that there is always a tavern and a general shop in the location, and two other randomly generated locations
  List<LocationType?> getSettlementsLocations();

  /// Returns a generator for random location types for this settlement type
  Generator<LocationType> getLocationsTypeGenerator();

  /// Returns a generator for the settlement description
  Generator<String> getDescriptionGenerator(
      String settlementName, Race? dominantRace);

  /// Returns a generator for dominant occupations for this settlement type
  Generator<String> getDominantOccupationGenerator();

  /// Returns how many important people are there in this settlement type
  int getImportantPeopleCount();

  /// Returns a generator for important characters' occupations
  Generator<String> getImportantOccupationGenerator();

  /// Returns a generator for the settlement type population
  Generator<int> getPopulationGenerator();

  /// Returns a generator for a trouble this settlement type might have
  Generator<String> getTroubleGenerator();
}
