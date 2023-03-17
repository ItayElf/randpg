import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';

/// A class that generates generic skin tones
class GenericSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _skinTones = ['white', 'pale', 'brown', 'dark'];

  GenericSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a generic skin tone
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
