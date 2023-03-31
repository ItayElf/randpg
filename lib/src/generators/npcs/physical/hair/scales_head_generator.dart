import '../../../../entities/npcs/hair.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';

/// A class that generates scales head style
class ScalesHeadGenerator implements IGenerator<Hair> {
  late int _seed;

  static const _scalesHeadShapes = [
    'spiked',
    'ridged',
    'crested',
    'bumpy',
    'plated',
    'colorful',
    'smooth'
  ];

  ScalesHeadGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates head shape for dragonborns
  @override
  Hair generate() {
    final generator = ListItemGenerator(_scalesHeadShapes);
    generator.seed(_seed);
    return Hair(length: generator.generate(), type: "scales", color: "");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
