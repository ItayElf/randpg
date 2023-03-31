import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';

/// A class that generates a dragonborn personality quirk
class DragonbornPersonalityQuirkGenerator implements IGenerator<String> {
  late int _seed;

  static const _dragonbornQuirks = [
    'never asks for help',
    'sees other races as inferior',
    'keeps all of the promises',
    'despises fear and cowardice',
    'treats adversaries with respect',
    'values honor above all',
    'cannot use the breath weapon',
    'has a secret dragon master',
    'values the clan above anything else'
  ];

  DragonbornPersonalityQuirkGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality quirks for the given race
  @override
  String generate() {
    final generator = ListItemGenerator(_dragonbornQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
