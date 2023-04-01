import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'description_names_data.dart';

/// A class that generates a location name by combining an adjective and a noun
class DescriptionLocationNameGenerator implements IGenerator<String> {
  late int _seed;

  DescriptionLocationNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(["the"]),
    ListItemGenerator(descriptionNamePrefix),
    ListItemGenerator(descriptionNameSuffix),
  ];

  @override
  String generate() {
    List<IGenerator<String>> generators = List.from(_generatorsTemplate);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }

    return generators
        .map((generator) => generator.generate())
        .toList()
        .join(" ");
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
