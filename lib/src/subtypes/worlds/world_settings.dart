import '../../entities/deities/deity.dart';
import '../../generators/base/generator.dart';
import '../guilds/guild_type.dart';
import '../holidays/holiday_type.dart';
import '../kingdoms/kingdom_type.dart';
import '../landscapes/landscape_type.dart';
import 'lore/world_lore_type.dart';

/// A class that represents an abstract world settings
abstract class WorldSettings {
  /// Returns a generator for the name of the world
  Generator<String> getNameGenerator();

  /// Returns the name of this world settings
  String getSettingName();

  /// Returns a generator for how many kingdoms to generate
  Generator<int> getKingdomsCountGenerator();

  /// Returns a kingdom type used for generation
  KingdomType getKingdomType();

  /// Returns a list of landscape types, where null is a random landscape type
  List<LandscapeType?> getLandscapeTypes();

  /// Returns a generator for random landscape types
  Generator<LandscapeType> getLandscapeTypeGenerator();

  /// Returns how many important people to generate for this world settings
  int getImportantPeopleCount();

  /// Returns a generator for the occupation of the important people in the world settings
  Generator<String> getImportantOccupationGenerator();

  /// Returns a generator for a guild type in the world
  Generator<GuildType> getGuildTypeGenerator();

  /// Returns a generator for a list of the main deities in the world
  Generator<List<Deity>> getDeitiesGenerator();

  /// Returns a generator for a list of lesser deities in this world settings
  Generator<List<Deity>> getLesserDeitiesGenerator();

  /// Returns a generator for a list of higher deities in this world settings
  Generator<List<Deity>> getHigherDeitiesGenerator();

  /// Returns the world lore type object for generating a lore for this world settings
  WorldLoreType getWorldLore();

  /// Returns a generator for a type of holiday that the world has
  Generator<HolidayType> getHolidayTypeGenerator();
}
