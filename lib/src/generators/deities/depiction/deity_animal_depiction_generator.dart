import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'deity_depiction_data.dart';

/// A class that generates animal depictions of deities
class DeityAnimalDepictionGenerator implements IGenerator<String> {
  late int _seed;

  DeityAnimalDepictionGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = BatchGenerator({
      "description": ListItemGenerator(deityDescription),
      "animal": ListItemGenerator(deityAnimals),
    });
    generator.seed(_seed);
    final results = generator.generate();

    return "${results["description"]} ${results["animal"]}";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
