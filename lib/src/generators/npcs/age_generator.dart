import '../../enums/race.dart';
import '../base/generator.dart';
import '../base/number_generator.dart';
import '../base/seed_generator.dart';

/// A class that generates a random age for a given race
class AgeGenerator implements IGenerator<int> {
  late int _seed;
  final Race _race;

  static const _maxAgeTable = {
    Race.dragonborn: 90,
    Race.dwarf: 350,
    Race.elf: 750,
    Race.gnome: 425,
    Race.halfElf: 180,
    Race.halfling: 150,
    Race.human: 90,
    Race.orc: 100,
    Race.tiefling: 100
  };

  AgeGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates a random age according to [_race]
  @override
  int generate() {
    final maxAge = _maxAgeTable[_race] ?? 100;
    final generator = NumberGenerator(1, maxAge);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
