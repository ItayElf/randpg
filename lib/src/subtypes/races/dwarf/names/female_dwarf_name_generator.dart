import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dwarf_name_data.dart';

/// A class used to generate female dwarf names
class FemaleDwarfNameGenerator extends FutureGenerator<String, List<String>> {
  FemaleDwarfNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(dwarfFemaleNamePrefix),
    ListItemGenerator(dwarfFemaleNameMiddle),
    ListItemGenerator(dwarfFemaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(dwarfSurnamePrefix),
    ListItemGenerator(dwarfSurnameSuffix),
  ];
}
