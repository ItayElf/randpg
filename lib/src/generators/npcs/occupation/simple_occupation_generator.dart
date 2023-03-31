import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'occupation_data.dart';

/// A class that generates simple occupations
class SimpleOccupationGenerator implements IGenerator<String> {
  late int _seed;

  SimpleOccupationGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListItemGenerator(simpleOccupations);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
