import '../../../strings_manipulations.dart';
import '../../base/constant_generator.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_batch_generator.dart';
import '../../base/list_item_generator.dart';
import 'landscape_names_data.dart';

/// A class that generates adjectives landscape names
class LandscapeAdjectiveNameGenerator
    extends FutureGenerator<String, List<String>> {
  LandscapeAdjectiveNameGenerator(List<String> landscapeTitles)
      : super(
          ListBatchGenerator(
            _getTemplate(landscapeTitles),
          ),
          (results) => titledEach(results.join(" ")),
        );

  static List<Generator<String>> _getTemplate(List<String> landscapeTitles) => [
        ConstantGenerator("the"),
        ListItemGenerator(landscapeAdjectives),
        ListItemGenerator(landscapeTitles),
      ];
}
