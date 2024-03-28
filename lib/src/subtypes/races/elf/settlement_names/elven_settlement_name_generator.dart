import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'elven_settlement_names_data.dart';

/// A class that generates elven settlement names
class ElvenSettlementNameGenerator
    extends FutureGenerator<String, List<String>> {
  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(elfSettlementNamePrefix),
    ListItemGenerator(elfSettlementNameMiddle),
    ListItemGenerator(elfSettlementNameSuffix),
  ];

  ElvenSettlementNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );
}
