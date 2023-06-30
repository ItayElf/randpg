import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'goblin_name_data.dart';

/// A class used to generate male goblin names
class MaleGoblinNameGenerator extends FutureGenerator<String, List<String>> {
  MaleGoblinNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(goblinMaleNamePrefix),
    WeightedGenerator(goblinNameVowel),
    ListItemGenerator(goblinMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(goblinFemaleNamePrefix),
    WeightedGenerator(goblinNameVowel),
    ListItemGenerator(goblinFemaleNameSuffix),
    WeightedGenerator(goblinNameVowelSuffix),
  ];
}
