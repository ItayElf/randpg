import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/guilds/names/guild_names_data.dart';
import '../../../../strings_manipulations.dart';

/// A class that generates guild names from adjectives
class KnightsOrderNameGenerator extends FutureGenerator<String, String> {
  KnightsOrderNameGenerator()
      : super(
          ListItemGenerator(guildNameAdjective),
          (results) => titledEach("The $results order"),
        );
}
