import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dwarf_name_data.dart';

/// A class used to generate male dwarf names
class MaleDwarfNameGenerator extends FutureGenerator<String, List<String>> {
  MaleDwarfNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(dwarfMaleNamePrefix),
    ListItemGenerator(dwarfMaleNameMiddle),
    ListItemGenerator(dwarfMaleNameSuffix),
    ConstantGenerator(" "),
    ListItemGenerator(dwarfSurnamePrefix),
    ListItemGenerator(dwarfSurnameSuffix),
  ];
}
