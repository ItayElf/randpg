import '../../../entities/deities/deity.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../../subtypes/deities/gods/god.dart';
import '../../base/generator.dart';
import '../../base/seed_generator.dart';
import '../../deities/deity_generator.dart';

/// A class that generates a god for each alignment
class FullAlignmentGodsGenerator implements Generator<List<Deity>> {
  late int _seed;

  FullAlignmentGodsGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Deity> generate() {
    final List<Deity> results = [];
    DeityGenerator generator;
    int tempSeed = _seed;

    for (final moral in MoralAlignment.values) {
      for (final ethical in EthicalAlignment.values) {
        final alignment = Alignment(ethical: ethical, moral: moral);
        generator = DeityGenerator(God(), alignment);
        generator.seed((tempSeed) % SeedGenerator.maxSeed);
        results.add(generator.generate());
        tempSeed = (tempSeed * tempSeed) + 1;
      }
    }

    return results;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
