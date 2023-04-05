import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'elf_name_data.dart';

/// A class used to generate male elf names
class MaleElfNameGenerator extends FutureGenerator<String, List<String>> {
  MaleElfNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(elfMaleName),
    ListItemGenerator([" "]),
    ListItemGenerator(elfSurnamePrefix),
    ListItemGenerator(elfSurnameSuffix)
  ];
}
