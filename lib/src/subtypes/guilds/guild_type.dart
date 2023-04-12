import '../../generators/base/generator.dart';

/// A class that represents a guild type
abstract class GuildType {
  /// Returns a generator for a guild name
  IGenerator<String> getNameGenerator();

  /// Returns the occupation of the guild leader
  String getLeaderOccupation();

  /// Returns the type of the guild
  String getGuildType();

  /// Returns a generator for the reputation of a guild
  IGenerator<String> getReputationGenerator();

  /// Returns a generator for the history of the guild
  IGenerator<String> getHistoryGenerator();

  /// Returns a generator for a guild motto
  IGenerator<String> getMottoGenerator();

  /// Returns a generator for a specialty of the guild
  IGenerator<String> getSpecialtyGenerator();

  /// Returns a generator for a quest of the guild
  IGenerator<String> getQuestGenerator();

  /// Returns a generator for an occupation of a guild member
  IGenerator<String> getMemberOccupationGenerator();
}
