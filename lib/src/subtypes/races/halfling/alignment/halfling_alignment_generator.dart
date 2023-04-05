import '../../../../entities/npcs/alignment.dart';
import '../../../../enums/alignment.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';

/// A class that generates an halfling alignment
class HalflingAlignmentGenerator implements IGenerator<Alignment> {
  late int _seed;

  static const _ethicalMap = {
    EthicalAlignment.lawful: 5,
    EthicalAlignment.ethicalTrue: 2,
    EthicalAlignment.chaotic: 1,
  };

  static const _moralMap = {
    MoralAlignment.good: 5,
    MoralAlignment.neutral: 2,
    MoralAlignment.evil: 1,
  };

  HalflingAlignmentGenerator() {
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
