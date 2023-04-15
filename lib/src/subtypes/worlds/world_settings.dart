import '../../entities/deities/deity.dart';
import '../../generators/base/generator.dart';
import '../guilds/guild_type.dart';
import '../kingdoms/kingdom_type.dart';
import '../landscapes/landscape_type.dart';
import 'lore/world_lore_type.dart';

/// A class that represents an abstract world settings
abstract class WorldSettings {
  /// Returns a generator for the name of the world
  IGenerator<String> getNameGenerator();

  /// Returns the name of this world settings
  String getSettingName();

  /// Returns a generator for how many kingdoms to generate
  IGenerator<int> getKingdomsCountGenerator();

  /// Returns a kingdom type used for generation
  KingdomType getKingdomType();

  /// Returns a list of landscape types, where null is a random landscape type
  List<LandscapeType?> getLandscapeTypes();

  /// Returns a generator for random landscape types
  IGenerator<LandscapeType> getLandscapeTypeGenerator();

  /// Returns how many important people to generate for this world settings
  int getImportantPeopleCount();

  /// Returns a generator for the occupation of the important people in the world settings
  IGenerator<String> getImportantOccupationGenerator();

  /// Returns a generator for a guild type in the world
  IGenerator<GuildType> getGuildTypeGenerator();

  /// Returns a generator for a list of the main deities in the world
  IGenerator<List<Deity>> getDeitiesGenerator();

  /// Returns a generator for a list of lesser deities in this world settings
  IGenerator<List<Deity>> getLesserDeitiesGenerator();

  /// Returns a generator for a list of higher deities in this world settings
  IGenerator<List<Deity>> getHigherDeitiesGenerator();

  /// Returns the world lore type object for generating a lore for this world settings
  WorldLoreType getWorldLore();
}
