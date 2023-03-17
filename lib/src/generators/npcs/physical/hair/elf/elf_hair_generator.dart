import '../../../../../entities/npcs/hair.dart';
import '../../../../base/generator.dart';
import '../../../../base/seed_generator.dart';
import '../../../../base/weighted_generator.dart';
import 'elf_hair_data.dart';

/// A class that generates elven hair style based on gender
class ElfHairGenerator implements IGenerator<Hair> {
  late int _seed;

  ElfHairGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates elven hair style
  @override
  Hair generate() {
    final generators = [
      WeightedGenerator(elfHairLength),
      WeightedGenerator(elfHairType),
      WeightedGenerator(elfHairColor),
    ];

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    final generatedHairStyle =
        generators.map((generator) => generator.generate()).toList();

    return Hair(
      length: generatedHairStyle[0],
      type: generatedHairStyle[1],
      color: generatedHairStyle[2],
    );
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
