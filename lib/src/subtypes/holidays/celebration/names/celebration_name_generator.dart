import 'package:randpg/src/generators/base/list_item_generator.dart';

import '../../../../generators/base/future_generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/multiple_generator.dart';
import '../../../../strings_manipulations.dart';
import 'celebration_name_data.dart';

/// A class that generates names for celebrations
class CelebrationNameGenerator extends FutureGenerator<String, List<String>> {
  CelebrationNameGenerator()
      : super(
          MultipleGenerator([
            _firstTemplate,
            _secondTemplate,
            _thirdTemplate,
          ]),
          (results) => titledEach(results.join(" ")),
        );

  static ListBatchGenerator<String> get _firstTemplate => ListBatchGenerator([
        ListItemGenerator(celebratoryAdjectives),
        ListItemGenerator(celebratoryEtherealNouns),
        ListItemGenerator(celebratoryNouns),
      ]);

  static ListBatchGenerator<String> get _secondTemplate => ListBatchGenerator([
        ListItemGenerator(["the"]),
        ListItemGenerator(celebratoryNouns),
        ListItemGenerator(["of"]),
        ListItemGenerator(celebratoryEtherealNouns),
      ]);

  static ListBatchGenerator<String> get _thirdTemplate => ListBatchGenerator([
        ListItemGenerator(celebratoryEtherealNouns),
        ListItemGenerator(celebratoryTime),
      ]);
}
