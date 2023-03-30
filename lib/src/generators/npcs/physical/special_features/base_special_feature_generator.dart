import '../../../base/generator.dart';
import '../../../base/number_generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'special_features_data.dart';

/// A class that generates special features
class BaseSpecialFeaturesGenerator implements IGenerator<List<String>> {
  late int _seed;

  static const _minFeatures = 1;
  static const _maxFeatures = 3;

  BaseSpecialFeaturesGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates special features for the given race
  @override
  List<String> generate() {
    final numberGenerator = NumberGenerator(_minFeatures, _maxFeatures + 1);
    numberGenerator.seed(_seed);
    final features = numberGenerator.generate();

    final featuresGenerator = UniqueGenerator(genericSpecialFeatures, features);
    featuresGenerator.seed(_seed + 1);
    return featuresGenerator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
