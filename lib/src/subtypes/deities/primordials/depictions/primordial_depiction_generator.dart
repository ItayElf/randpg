import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_batch_generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../strings_manipulations.dart';
import 'primordial_depiction_data.dart';

/// A class that generates depictions for primordials
class PrimordialDepictionGenerator implements Generator<String> {
  late int _seed;

  PrimordialDepictionGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListBatchGenerator([
      ListItemGenerator(primordialPhysicalAppearance),
      ListItemGenerator(primordialFeatures),
    ]);
    generator.seed(_seed);
    return article(generator.generate().join(" with "));
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
