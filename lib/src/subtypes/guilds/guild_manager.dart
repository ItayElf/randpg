import 'package:collection/collection.dart';

import '../../randpg_exceptions.dart';
import 'artisans_guild/artisans_guild.dart';
import 'druid_circle/druid_circle.dart';
import 'guild_type.dart';
import 'knights_order/knights_order.dart';
import 'mages_guild/mages_guild.dart';
import 'merchants_guild/merchants_guild.dart';
import 'thieves_guild/thieves_guild.dart';

/// A class that handles the available guilds and using them
///
/// When making a custom guild type, make sure to register it or else some features might not work
abstract class GuildManager {
  static final Set<GuildType> _guildTypes = {
    ThievesGuild(),
    MerchantsGuild(),
    KnightsOrder(),
    MagesGuild(),
    DruidCircle(),
    ArtisansGuild(),
  };

  static final Set<GuildType> _activeGuildTypes = {..._guildTypes};

  /// Returns all the guild types
  static List<GuildType> get allGuilds =>
      _guildTypes.toList()..sortBy((guildType) => guildType.getGuildType());

  /// Returns all active guilds
  static List<GuildType> get activeGuildTypes => _activeGuildTypes.toList()
    ..sortBy((guildType) => guildType.getGuildType());

  /// Returns the corresponding guild type from all guilds with type [type]
  static GuildType getGuildTypeByType(String type) {
    return _guildTypes.firstWhere(
      (guildType) => guildType.getGuildType() == type,
      orElse: () => throw GuildTypeNotFoundException(
          "GuildType with type $type was not found"),
    );
  }

  /// Adds [guildType] to the list of all guild types and active guild types
  static void registerGuildType(GuildType guildType) {
    _guildTypes.add(guildType);
    _activeGuildTypes.add(guildType);
  }

  /// Removes [guildType] only from the active guild types
  static void unregisterGuildType(GuildType guildType) {
    _activeGuildTypes.remove(getGuildTypeByType(guildType.getGuildType()));
  }

  /// Removes [guildType] from the active guild types and from all guild types list
  static void deleteGuildType(GuildType guildType) {
    final foundGuildType = getGuildTypeByType(guildType.getGuildType());
    _guildTypes.remove(foundGuildType);
    _activeGuildTypes.remove(foundGuildType);
  }
}
