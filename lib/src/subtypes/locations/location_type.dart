import '../../entities/npcs/npc.dart';
import '../../entities/settlements/goods.dart';
import '../../generators/base/generator.dart';

/// A class that represent an abstract location type
abstract class LocationType {
  /// Returns the name generator for this location type
  Generator<String> getNameGenerator(Npc owner);

  /// Returns the occupation of the owner
  String getOwnerOccupation();

  /// Returns the location type
  String getLocationType();

  /// Returns the zone generator for this location type
  Generator<String> getZoneGenerator();

  /// Returns the outside description generator for this location type
  Generator<String> getOutsideDescription();

  /// Returns the building description generator
  Generator<String> getBuildingDescriptionGenerator(
    String locationType,
    String locationName,
    Npc owner,
  );

  /// Returns the goods generator for this location type
  Generator<List<Goods>?> getGoodsGenerator();
}
