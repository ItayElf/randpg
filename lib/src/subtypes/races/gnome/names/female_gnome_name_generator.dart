import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'gnome_name_data.dart';

/// A class used to generate female gnome names
class FemaleGnomeNameGenerator extends FutureGenerator<String, List<String>> {
  FemaleGnomeNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(gnomeFemaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(gnomeMaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameSuffix),
  ];
}
