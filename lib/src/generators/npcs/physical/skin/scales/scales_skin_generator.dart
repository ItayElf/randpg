import 'package:radnpg/src/generators/base/list_item_generator.dart';

import '../../../../base/generator.dart';
import '../../../../base/seed_generator.dart';

/// A class that generates scales colors and texture
class ScalesSkinGenerator implements IGenerator<String> {
  late int _seed;

  static const _scaleTexture = [
    'rough',
    'smooth',
    'shiny',
    'rugged',
    'dirty',
    'pointy',
    'broad',
    'ridged'
  ];

  static const _scaleColor = [
    'black',
    'blue',
    'brass',
    'bronze',
    'copper',
    'gold',
    'green',
    'red',
    'silver',
    'white'
  ];

  ScalesSkinGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a random scales color and texture
  @override
  String generate() {
    final generators = [
      ListItemGenerator(_scaleTexture),
      ListItemGenerator(_scaleColor),
      ListItemGenerator(["scales"]),
    ];

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return generators
        .map((generator) => generator.generate())
        .toList()
        .join(" ");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
