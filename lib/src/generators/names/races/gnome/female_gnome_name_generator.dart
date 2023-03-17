import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import '../../../base/weighted_generator.dart';
import 'gnome_name_data.dart';

/// A class used to generate female gnome names
class FemaleGnomeNameGenerator implements IGenerator<String> {
  late int _seed;

  FemaleGnomeNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(gnomeFemaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(gnomeMaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameSuffix),
  ];

  /// Generates a name of a female gnome
  @override
  String generate() {
    List<IGenerator<String>> generators = List.from(_generatorsTemplate);

    for (int i = 0; i < generators.length; i++) {
      generators[i].seed((_seed + i) % SeedGenerator.maxSeed);
    }
    return generators.map((generator) => generator.generate()).toList().join();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
