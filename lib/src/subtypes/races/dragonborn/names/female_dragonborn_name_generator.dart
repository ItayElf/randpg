import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dragonborn_name_data.dart';

/// A class used to generate female dragonborn names
class FemaleDragonbornNameGenerator
    extends FutureGenerator<String, List<String>> {
  FemaleDragonbornNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(dragonbornFemaleNamePrefix),
    ListItemGenerator(dragonbornFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(dragonbornSurnamePrefix),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameMiddle),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameSuffix)
  ];
}
