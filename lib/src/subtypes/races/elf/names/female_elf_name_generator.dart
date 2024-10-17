import '../../../../generators/base/constant_generator.dart';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'elf_name_data.dart';

/// A class used to generate female elf names
class FemaleElfNameGenerator extends FutureGenerator<String, List<String>> {
  FemaleElfNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(elfFemaleName),
    ConstantGenerator(" "),
    ListItemGenerator(elfSurnamePrefix),
    ListItemGenerator(elfSurnameSuffix)
  ];
}
