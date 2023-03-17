import '../../../../../entities/npcs/hair.dart';
import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';

/// A class that generates dragonborns head style
class DragonbornHeadGenerator implements IGenerator<Hair> {
  late int _seed;

  static const _dragonbornHeadShapes = [
    'spiked',
    'ridged',
    'crested',
    'bumpy',
    'plated',
    'colorful',
    'smooth'
  ];

  DragonbornHeadGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates head shape for dragonborns
  @override
  Hair generate() {
    final generator = ListItemGenerator(_dragonbornHeadShapes);
    generator.seed(_seed);
    return Hair(length: generator.generate(), type: "scales", color: "");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
