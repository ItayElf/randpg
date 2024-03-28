import '../../../../entities/npcs/alignment.dart';
import '../../../../enums/alignment.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';

/// A class that generates an elven alignment
class ElvenAlignmentGenerator implements Generator<Alignment> {
  late int _seed;

  static const _ethicalMap = {
    EthicalAlignment.chaotic: 5,
    EthicalAlignment.ethicalTrue: 2,
    EthicalAlignment.lawful: 1,
  };

  static const _moralMap = {
    MoralAlignment.evil: 1,
    MoralAlignment.good: 1,
    MoralAlignment.neutral: 1,
  };

  ElvenAlignmentGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  Alignment generate() {
    final generator = BatchGenerator({
      "ethical": WeightedGenerator(_ethicalMap),
      "moral": WeightedGenerator(_moralMap),
    });
    generator.seed(_seed);
    final generatedAlignment = generator.generate();

    return Alignment.fromMap(
      Map.fromEntries(
        generatedAlignment.entries.map(
          (entry) => MapEntry(entry.key, entry.value.name),
        ),
      ),
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
