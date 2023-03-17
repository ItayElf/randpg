import '../../../../../enums/gender.dart';
import '../../../../base/generator.dart';
import '../../../../base/list_item_generator.dart';
import '../../../../base/seed_generator.dart';
import '../../../../base/weighted_generator.dart';
import 'elf_hair_data.dart';

/// A class that generates elven hair style based on gender
class GenericHairGenerator implements IGenerator<String> {
  late int _seed;

  GenericHairGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates elven hair style
  @override
  String generate() {
    final generators = [
      WeightedGenerator(elfHairLength),
      WeightedGenerator(elfHairType),
      WeightedGenerator(elfHairColor),
      ListItemGenerator(["hair"])
    ];

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    final generatedHairStyle =
        generators.map((generator) => generator.generate()).toList();
    if (generatedHairStyle.first == "bald") {
      return "bald hair";
    }
    return generatedHairStyle.join(" ");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
