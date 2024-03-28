import '../../../entities/deities/deity.dart';
import '../../../subtypes/deities/deity_type.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../deities/deity_generator.dart';
import '../../npcs/personality/alignment/base_alignment_generator.dart';

/// A class that generates world deities by type and count
class WorldDeitiesBatchGenerator implements Generator<List<Deity>> {
  late int _seed;
  final Map<DeityType, int> _pool;

  WorldDeitiesBatchGenerator(this._pool) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Deity> generate() {
    final List<Deity> results = [];
    int tempSeed = _seed;

    for (final entry in _pool.entries) {
      for (int i = 0; i < entry.value; i++) {
        results.add(_generateDeity(entry.key, tempSeed));
        tempSeed = (tempSeed * tempSeed * tempSeed) + 1;
      }
    }

    return results;
  }

  Deity _generateDeity(DeityType type, int seed) {
    final alignmentGenerator = BaseAlignmentGenerator();
    alignmentGenerator.seed(seed % SeedGenerator.maxSeed);
    final alignment = alignmentGenerator.generate();
    seed = (seed * seed) + 1;

    final generator = DeityGenerator(type, alignment);
    generator.seed(seed % SeedGenerator.maxSeed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
