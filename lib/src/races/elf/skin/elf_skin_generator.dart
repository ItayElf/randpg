import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates elven skin tones
class ElfSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _skinTones = [
    "white",
    "pale",
    "brown",
    'blueish',
    'pink',
    'golden',
    'silver',
    'green',
    'copper'
  ];

  ElfSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates an elven skin tone
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
