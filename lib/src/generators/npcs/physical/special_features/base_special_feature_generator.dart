import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'special_features_data.dart';

/// A class that generates a special feature
class BaseSpecialFeatureGenerator implements IGenerator<String> {
  late int _seed;

  BaseSpecialFeatureGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a special features
  @override
  String generate() {
    final generator = ListItemGenerator(genericSpecialFeatures);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
