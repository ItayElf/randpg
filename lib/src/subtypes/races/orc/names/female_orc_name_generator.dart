import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'orc_name_data.dart';

/// A class used to generate female orc names
class FemaleOrcNameGenerator extends FutureGenerator<String, List<String>> {
  FemaleOrcNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(orcFemaleNamePrefix),
    WeightedGenerator(orcFemaleNameVowel),
    ListItemGenerator(orcFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(orcMaleNamePrefix),
    WeightedGenerator(orcMaleNameVowel),
    ListItemGenerator(orcMaleNameSuffix)
  ];
}
