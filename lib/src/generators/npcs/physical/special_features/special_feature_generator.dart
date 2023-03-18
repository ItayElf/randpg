import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/number_generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/unique_generator.dart';
import 'special_features_data.dart';

/// A class that generates special features
class SpecialFeaturesGenerator implements IGenerator<List<String>> {
  late int _seed;
  final Race _race;

  static const _minFeatures = 1;
  static const _maxFeatures = 3;

  SpecialFeaturesGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates special features for the given race
  @override
  List<String> generate() {
    List<String> pool = _getFeaturesPool(_race);

    final numberGenerator = NumberGenerator(_minFeatures, _maxFeatures + 1);
    numberGenerator.seed(_seed);
    final features = numberGenerator.generate();

    final featuresGenerator = UniqueGenerator(pool, features);
    featuresGenerator.seed(_seed + 1);
    return featuresGenerator.generate();
  }

  /// Returns the pool to generate special features from
  static List<String> _getFeaturesPool(Race race) {
    List<String> pool = genericSpecialFeatures;
    for (var entry in specialFeaturesMap.entries) {
      if (entry.key.contains(race)) {
        pool += entry.value;
      }
    }
    return pool;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
