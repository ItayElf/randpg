import '../../../strings_manipulations.dart';
import '../../base/constant_generator.dart ';
import '../../base/future_generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/list_item_generator.dart';
import 'guild_names_data.dart';

/// A class that generates guild names from verbs
class GuildVerbNameGenerator extends FutureGenerator<String, List<String>> {
  GuildVerbNameGenerator()
      : super(
          ListBatchGenerator([
            ConstantGenerator("The"),
            ListItemGenerator(guildNameAdjective),
            ListItemGenerator(guildNameVerbs),
          ]),
          (results) => titledEach(results.join(" ")),
        );
}
