import '../../../../strings_manipulations.dart';
import '../../../base/future_generator.dart';
import '../../../base/generator.dart';
import '../../../base/list_batch_generator.dart';
import '../../../base/list_item_generator.dart';
import 'description_names_data.dart';

/// A class that generates a location name by combining an adjective and a noun
class DescriptionLocationNameGenerator
    extends FutureGenerator<String, List<String>> {
  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(["the"]),
    ListItemGenerator(descriptionNamePrefix),
    ListItemGenerator(descriptionNameSuffix),
  ];

  DescriptionLocationNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join(" ")),
        );
}
