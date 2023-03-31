import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates a gnomish personality quirk
class GnomePersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  static const _gnomeQuirks = [
    'makes the best out of any situation',
    'is always tinkering in the free time',
    'has a solution for everything',
    'explains everything in great detail',
    'has a fascination with explosions',
    'never stops talking',
    'complicates simple situations',
    'is always scribbling notes',
    'keeps a very precise journal',
    'always has plans for a new invention',
    'loves shiny objects',
    'has a fascination with alchemy',
    'is fascinated by magic and its history',
    'is way too curious',
    'talks so fast that it is very difficult to understand'
  ];

  GnomePersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a personality quirk
  @override
  String generate() {
    final generator = ListItemGenerator(_gnomeQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
