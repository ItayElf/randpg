import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'tiefling_name_data.dart';

/// A class used to generate female tiefling names
class FemaleTieflingNameGenerator
    extends FutureGenerator<String, List<String>> {
  FemaleTieflingNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(tieflingFemaleNamePrefix),
    ListItemGenerator(tieflingFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(tieflingMaleNamePrefix),
    ListItemGenerator(tieflingMaleNameSuffix)
  ];
}
