import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates gnomish skin tones
class GnomeSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _skinTones = [
    "ruddy tan",
    "woody brown",
    "rocky gray",
    "gray",
    "white",
    "pinkish"
  ];

  GnomeSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a gnomish skin tone
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
