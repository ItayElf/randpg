import '../../../../generators/base/constant_generator.dart ';
import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/multiple_generator.dart';
import '../../../../strings_manipulations.dart';
import 'tragedy_names_data.dart';

/// A class that generates names for tragedies
class TragedyNameGenerator extends FutureGenerator<String, List<String>> {
  TragedyNameGenerator()
      : super(
          MultipleGenerator([
            _firstTemplate,
            _secondTemplate,
            _thirdTemplate,
          ]),
          (results) => titledEach(results.join(" ")),
        );

  static ListBatchGenerator<String> get _firstTemplate => ListBatchGenerator([
        ListItemGenerator(tragedyTime),
        ConstantGenerator("of"),
        ListItemGenerator(tragedyEmotionWords),
        ConstantGenerator("for"),
        ListItemGenerator(tragedyNouns),
      ]);

  static ListBatchGenerator<String> get _secondTemplate => ListBatchGenerator([
        ListItemGenerator(tragedyActions),
        ConstantGenerator("of"),
        ListItemGenerator(tragedyEmotionWords),
        ConstantGenerator("for"),
        ListItemGenerator(tragedyNouns + tragedyMyths),
      ]);

  static ListBatchGenerator<String> get _thirdTemplate => ListBatchGenerator([
        ListItemGenerator(tragedyMythNouns),
        ConstantGenerator("of"),
        ListItemGenerator(tragedyMyths),
      ]);
}
