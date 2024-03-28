import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'gnome_name_data.dart';

/// A class used to generate male gnome names
class MaleGnomeNameGenerator extends FutureGenerator<String, List<String>> {
  MaleGnomeNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(gnomeMaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(gnomeFemaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameSuffix),
  ];
}
