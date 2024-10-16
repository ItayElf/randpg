import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'temple_names_data.dart';

/// A class that generates temple names
class TempleNameGenerator extends FutureGenerator<String, List<String>> {
  TempleNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (result) => titledEach(result.join(" ")),
        );

  static final List<Generator<String>> _generatorsTemplate = [
    ConstantGenerator("the"),
    ListItemGenerator(templeNamesPrefix),
    ListItemGenerator(templeNamesSuffix),
  ];
}
