import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'tiefling_name_data.dart';

/// A class used to generate male tiefling names
class MaleTieflingNameGenerator extends FutureGenerator<String, List<String>> {
  MaleTieflingNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(tieflingMaleNamePrefix),
    ListItemGenerator(tieflingMaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(tieflingFemaleNamePrefix),
    ListItemGenerator(tieflingFemaleNameSuffix)
  ];
}
