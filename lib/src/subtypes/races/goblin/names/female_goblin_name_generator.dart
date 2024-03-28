import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'goblin_name_data.dart';

/// A class used to generate male goblin names
class FemaleGoblinNameGenerator extends FutureGenerator<String, List<String>> {
  FemaleGoblinNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(goblinFemaleNamePrefix),
    WeightedGenerator(goblinNameVowel),
    ListItemGenerator(goblinFemaleNameSuffix),
    WeightedGenerator(goblinNameVowelSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(goblinMaleNamePrefix),
    WeightedGenerator(goblinNameVowel),
    ListItemGenerator(goblinMaleNameSuffix),
  ];
}
