import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';

/// A class that generates tiefling skin tones
class TieflingSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _skinTones = ["red", "purple"];

  TieflingSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a tiefling skin tone
  @override
  String generate() {
    final generator = ListItemGenerator(_skinTones);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
