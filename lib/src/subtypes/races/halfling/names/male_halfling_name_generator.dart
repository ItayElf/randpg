import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'halfling_name_data.dart';

/// A class used to generate male halfling names
class MaleHalflingNameGenerator extends FutureGenerator<String, List<String>> {
  MaleHalflingNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(halflingMaleNamePrefix),
    ListItemGenerator(halflingMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(halflingSurnamePrefix),
    ListItemGenerator(halflingSurnameSuffix)
  ];
}
