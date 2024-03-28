import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../strings_manipulations.dart';
import 'dwarven_settlement_names_data.dart';

/// A class that generates dwarven settlement names
class DwarvenSettlementNameGenerator
    extends FutureGenerator<String, List<String>> {
  static final List<Generator<String>> _generatorsTemplate = [
    ListItemGenerator(dwarfSettlementNamePrefix),
    ListItemGenerator(dwarfSettlementNameMiddle),
    ListItemGenerator(dwarfSettlementNameSuffix),
  ];

  DwarvenSettlementNameGenerator()
      : super(
          ListBatchGenerator(_generatorsTemplate),
          (results) => titledEach(results.join()),
        );
}
