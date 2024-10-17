import '../../../strings_manipulations.dart';
import '../../base/constant_generator.dart';
import '../../base/future_generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/list_item_generator.dart';
import 'guild_names_data.dart';

/// A class that generates guild names from adjectives
class GuildAdjectiveNameGenerator
    extends FutureGenerator<String, List<String>> {
  GuildAdjectiveNameGenerator()
      : super(
          ListBatchGenerator([
            ConstantGenerator("The"),
            ListItemGenerator(guildNameAdjective),
            ListItemGenerator(guildNameNoun),
          ]),
          (results) => titledEach(results.join(" ")),
        );
}
