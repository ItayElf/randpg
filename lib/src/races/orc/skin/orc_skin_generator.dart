import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates orcish skin tones
class OrcSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _skinTones = ["green", "gray"];

  OrcSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a orcish skin tone
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
