import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates an orcish personality quirk
class OrcPersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  static const _orcQuirks = [
    'only respects powerful and competent leaders',
    "openly mocks human society's structure.",
    'occasionally challenges others to duels to the death',
    'will turn anything into an opportunity for training',
    'enjoys messing with other humanoids with smeller stature',
    'dislikes depending on others',
    'maintains a friendly relationships with nearby trolls'
  ];

  OrcPersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality quirk
  @override
  String generate() {
    final generator = ListItemGenerator(_orcQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
