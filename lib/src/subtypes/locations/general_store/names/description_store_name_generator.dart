import '../../../../generators/base/generator.dart';
import '../../../../generators/base/list_item_generator.dart';
import '../../../../generators/base/seed_generator.dart';
import 'store_names_data.dart';

/// A class that generates a store name by combining an adjective and a noun
class DescriptionStoreNameGenerator implements IGenerator<String> {
  late int _seed;

  DescriptionStoreNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(["the"]),
    ListItemGenerator(storeNamePrefix),
    ListItemGenerator(storeNameSuffix),
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
