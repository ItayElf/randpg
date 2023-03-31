import '../../../../entities/npcs/alignment.dart';
import '../../../../enums/alignment.dart';
import '../../../base/batch_generator.dart';
import '../../../base/generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';

/// A class that generates an alignment without a bias
class BaseAlignmentGenerator implements IGenerator<Alignment> {
  late int _seed;

  static const _ethicalMap = {
    EthicalAlignment.chaotic: 1,
    EthicalAlignment.ethicalTrue: 1,
    EthicalAlignment.lawful: 1,
  };

  static const _moralMap = {
    MoralAlignment.evil: 1,
    MoralAlignment.good: 1,
    MoralAlignment.neutral: 1,
  };

  BaseAlignmentGenerator() {
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
