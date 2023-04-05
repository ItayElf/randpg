import '../../../../entities/npcs/hair.dart';
import '../../../../generators/base/batch_generator.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../generators/base/weighted_generator.dart';

/// A class that generates elven hair style based on gender
class ElvenHairGenerator implements IGenerator<Hair> {
  late int _seed;

  static const _elfHairLength = {
    "short": 1,
    "medium": 3,
    "long": 4,
    "extremely long": 2
  };

  static const _elfHairType = {'straight': 6, 'wavy': 1, 'braided': 2};

  static const _elfHairColor = {
    'brown': 4,
    'auburn': 4,
    'blond': 3,
    'red': 1,
    'gray': 2,
    'white': 2,
    'black': 4,
    'dyed': 1,
    "green": 2,
    "blue": 1,
  };

  ElvenHairGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates elven hair style
  @override
  Hair generate() {
    final generator = BatchGenerator({
      "length": WeightedGenerator(_elfHairLength),
      "type": WeightedGenerator(_elfHairType),
      "color": WeightedGenerator(_elfHairColor),
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
