import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates an elven personality quirk
class ElfPersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  static const _elfQuirks = [
    'is disgusted by human architecture',
    'feels more comfortable while surrounded by nature',
    'is secretly captivated by dwarves',
    'has a deep knowledge of ancient secrets',
    'has a deep knowledge of ancient magic',
    'knows the name of all the local plants',
    'will only speak common if absolutely forced to',
    'never knows the current time and date',
    'paints stunning paintings in the spare time',
    'occasionally uses terms from a different language while speaking',
    'is always late',
    'has never declared himself an adult',
    'is deeply xenophobic'
  ];

  ElfPersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality quirk
  @override
  String generate() {
    final generator = ListItemGenerator(_elfQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
