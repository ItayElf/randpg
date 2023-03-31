import '../../../generators/base/generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../generators/base/unique_generator.dart';

/// A class that generates personality quirks
class DragonbornPersonalityQuirksGenerator implements IGenerator<List<String>> {
  late int _seed;

  static const _numberOfQuirks = 2;

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

  DragonbornPersonalityQuirksGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates personality quirks for the given race
  @override
  List<String> generate() {
    final generator = UniqueGenerator(_dragonbornQuirks, _numberOfQuirks);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
