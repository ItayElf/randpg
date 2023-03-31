import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'build_data.dart';

/// A class that generates a strong build
class StrongBuildGenerator implements IGenerator<String> {
  late int _seed;

  StrongBuildGenerator() {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListItemGenerator(strongBuild);
    generator.seed(_seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
