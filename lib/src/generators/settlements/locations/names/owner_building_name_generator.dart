import '../../../../strings_manipulations.dart';
import '../../../base/constant_generator.dart';
import '../../../base/future_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_batch_generator.dart';
import '../../../base/list_item_generator.dart';

class OwnerBuildingNameGenerator extends FutureGenerator<String, List<String>> {
  OwnerBuildingNameGenerator(String ownerName, String locationType)
      : super(
          ListBatchGenerator(_generatorsTemplate(ownerName, locationType)),
          (results) => titledEach(results.join(" ")),
        );

  static List<Generator<String>> _generatorsTemplate(
    String ownerName,
    String locationType,
  ) =>
      [
        ListItemGenerator(ownerName.split(" ").map((e) => "$e's").toList()),
        ConstantGenerator(locationType),
      ];
}
