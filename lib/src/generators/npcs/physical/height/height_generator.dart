import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/number_generator.dart';
import '../../../base/seed_generator.dart';
import 'height_data.dart';

/// A class that generates a height based on the race
class HeightGenerator implements IGenerator<int> {
  late int _seed;
  final Race _race;

  HeightGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates height based on a race
  @override
  int generate() {
    final modifier = heightModifier[_race] ?? 0;
    final generator = NumberGenerator(baseHeightMinimum, baseHeightMaximum);
    generator.seed(_seed);
    return generator.generate() + modifier;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
