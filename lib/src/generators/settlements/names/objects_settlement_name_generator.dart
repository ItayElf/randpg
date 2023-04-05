import '../../../strings_manipulations.dart';
import '../../base/batch_generator.dart';
import '../../base/future_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'settlement_name_data.dart';

/// A class that generates settlement name from objects and adjectives
class ObjectSettlementNameGenerator implements IGenerator<String> {
  late int _seed;

  ObjectSettlementNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static const _prefixPool = [
    ...landscapeAdjectives,
    ...wildCreatures,
    ...manMadeFeatures,
  ];
  static const _suffixPool = [
    ...landscapeFeatures,
    ...manMadeFeatures,
    ...nameVerbs,
  ];

  @override
  String generate() {
    final generator = FutureGenerator(
      BatchGenerator({
        "prefix": ListItemGenerator(_prefixPool),
        "suffix": ListItemGenerator(_suffixPool),
      }),
      (result) => result.values.join(""),
    );
    generator.seed(_seed);
    return titledEach(generator.generate());
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
