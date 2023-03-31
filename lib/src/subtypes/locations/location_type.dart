import '../../entities/npcs/npc.dart';
import '../../entities/settlements/goods.dart';
import '../../generators/base/generator.dart';

/// A class that represent an abstract location type
abstract class LocationType {
  /// Returns the name generator for this location type
  IGenerator<String> getNameGenerator(Npc owner);

  /// Returns the occupation of the owner
  String getOwnerOccupation();

  /// Returns the location type
  String getLocationType();

  /// Returns the zone generator for this location type
  IGenerator<String> getZoneGenerator();

  /// Returns the outside description generator for this location type
  IGenerator<String> getOutsideDescription();

  /// Returns the building description generator
  IGenerator<String> getBuildingDescriptionGenerator(Npc owner);

  /// Returns the goods generator for this location type
  IGenerator<List<Goods>?> getGoodsGenerator();
}
