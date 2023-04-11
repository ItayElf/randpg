import '../../entities/deities/deity.dart';
import '../../entities/worlds/world_lore.dart';
import '../../generators/base/generator.dart';
import '../landscapes/landscape_type.dart';
import '../settlements/settlement_type.dart';

/// A class that represents an abstract world settings
abstract class WorldSettings {
  /// Returns a generator for the name of the world
  IGenerator<String> getNameGenerator();

  /// Returns the name of this world settings
  String getSettingName();

  /// Returns a list of settlement types, where null is a random type
  List<SettlementType?> getSettlementTypes();

  /// Returns a generator for a random settlement type
  IGenerator<SettlementType> getSettlementTypeGenerator();

  /// Returns a list of landscape types, where null is a random landscape type
  List<LandscapeType?> getLandscapeTypes();

  /// Returns a generator for random landscape types
  IGenerator<LandscapeType> getLandscapeTypeGenerator();

  /// Returns how many important people to generate for this world settings
  int getImportantPeopleCount();

  /// Returns a generator for the occupation of the important people in the world settings
  IGenerator<String> getImportantOccupationGenerator();

  /// Returns a generator for a list of the main deities in the world
  IGenerator<List<Deity>> getDeitiesGenerator();

  /// Returns a generator for a list of lesser deities in this world settings
  IGenerator<List<Deity>> getLesserDeitiesGenerator();

  /// Returns a generator for a list of higher deities in this world settings
  IGenerator<List<Deity>> getHigherDeitiesGenerator();

  /// Returns the world lore object for generating a lore for this world settings
  WorldLore getWorldLore();
}
