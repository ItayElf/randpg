import '../../../strings_manipulations.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/list_item_generator.dart';
import 'guild_names_data.dart';

/// A class that generates guild names from titles
class GuildTitleNameGenerator extends FutureGenerator<String, List<String>> {
  GuildTitleNameGenerator(IGenerator<String> titleGenerator)
      : super(
          ListBatchGenerator([
            ListItemGenerator(["The"]),
            ListItemGenerator(guildNameAdjective),
            titleGenerator,
          ]),
          (results) => titledEach(results.join(" ")),
        );
}
