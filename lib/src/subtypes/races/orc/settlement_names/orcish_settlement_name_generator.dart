import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'orcish_settlement_names_data.dart';

/// A class that generates orcish settlement names
class OrcishSettlementNameGenerator
    extends FutureGenerator<String, List<String>> {
  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(orcSettlementNamePrefix),
    ListItemGenerator(orcSettlementNameVowels),
    ListItemGenerator(orcSettlementNameMiddle),
    ListItemGenerator(orcSettlementNameSuffix),
  ];

  OrcishSettlementNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );
}
