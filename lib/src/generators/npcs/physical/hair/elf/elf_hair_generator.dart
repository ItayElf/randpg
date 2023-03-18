import '../../../../../entities/npcs/hair.dart';
import '../../../../base/batch_generator.dart';
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
    final generator = BatchGenerator({
      "length": WeightedGenerator(elfHairLength),
      "type": WeightedGenerator(elfHairType),
      "color": WeightedGenerator(elfHairColor),
    });

    generator.seed(_seed);
    final generatedHairStyle = generator.generate();

    return Hair.fromMap(generatedHairStyle);
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
