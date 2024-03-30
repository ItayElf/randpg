import '../../generators/base/generator.dart';
import '../emblems/emblem_type.dart';

/// A class that represents a guild type
abstract class GuildType {
  /// Returns a generator for a guild name
  Generator<String> getNameGenerator();

  /// Returns the occupation of the guild leader
  String getLeaderOccupation();

  /// Returns the type of the guild
  String getGuildType();

  /// Returns a generator for the reputation of a guild
  Generator<String> getReputationGenerator();

  /// Returns a generator for the history of the guild
  Generator<String> getHistoryGenerator(String guildName);

  /// Returns the emblem type for this guild type
  EmblemType getEmblemType();

  /// Returns a generator for a guild motto
  Generator<String> getMottoGenerator();

  /// Returns a generator for a specialty of the guild
  Generator<String> getSpecialtyGenerator();

  /// Returns a generator for a quest of the guild
  Generator<String> getQuestGenerator();

  /// Returns a generator for an occupation of a guild member
  Generator<String> getMemberOccupationGenerator();
}
