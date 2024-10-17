import '../../../../generators/base/constant_generator.dart';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'halfling_name_data.dart';

/// A class used to generate female halfling names
class FemaleHalflingNameGenerator
    extends FutureGenerator<String, List<String>> {
  FemaleHalflingNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(halflingFemaleNamePrefix),
    ListItemGenerator(halflingFemaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(halflingSurnamePrefix),
    ListItemGenerator(halflingSurnameSuffix)
  ];
}
