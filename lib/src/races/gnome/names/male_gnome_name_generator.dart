import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/seed_generator.dart';
import '../../../generators/base/weighted_generator.dart';
import 'gnome_name_data.dart';

/// A class used to generate male gnome names
class MaleGnomeNameGenerator implements IGenerator<String> {
  late int _seed;

  MaleGnomeNameGenerator() {
    _seed = SeedGenerator.generate();
  }

  static final List<IGenerator<String>> _generatorsTemplate = [
    ListItemGenerator(gnomeMaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeMaleNameSuffix),
    ListItemGenerator([" "]),
    ListItemGenerator(gnomeFemaleNamePrefix),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameMiddle),
    WeightedGenerator(gnomeNameVowel),
    ListItemGenerator(gnomeFemaleNameSuffix),
  ];

  /// Generates a name of a male gnome
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
