import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'occupation_data.dart';

/// A class that generates adventurer occupations
class AdventurerOccupationGenerator implements IGenerator<String> {
  late int _seed;

  AdventurerOccupationGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListItemGenerator(adventurerOccupation);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
