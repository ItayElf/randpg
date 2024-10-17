import '../../../../generators/base/constant_generator.dart';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/weighted_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dragonborn_name_data.dart';

/// A class used to generate male dragonborn names
class MaleDragonbornNameGenerator
    extends FutureGenerator<String, List<String>> {
  MaleDragonbornNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(dragonbornMaleNamePrefix),
    ListItemGenerator(dragonbornMaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(dragonbornSurnamePrefix),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameMiddle),
    WeightedGenerator(dragonbornSurnameVowel),
    ListItemGenerator(dragonbornSurnameSuffix)
  ];
}
