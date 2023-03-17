import '../../../../../base/generator.dart';
import '../../../../../base/list_item_generator.dart';
import '../../../../../base/seed_generator.dart';

/// A class that generates dragonborns head style
class DragonbornHeadGenerator implements IGenerator<String> {
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

  @override
  String generate() {
    final generator = ListItemGenerator(_dragonbornHeadShapes);
    generator.seed(_seed);
    return "${generator.generate()} head";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
