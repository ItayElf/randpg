import '../../../subtypes/races/race.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'deity_depiction_data.dart';

/// A class that generates humanoid depictions for deities
class DeityFigureDepictionGenerator implements IGenerator<String> {
  late int _seed;
  final Race? _worshipedBy;

  static const _numberOfDescriptors = 2;

  DeityFigureDepictionGenerator(this._worshipedBy) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = UniqueGenerator(
      ListItemGenerator(deityFeature),
      _numberOfDescriptors,
    );
    generator.seed(_seed);

    return "${generator.generate().join(" and ")} ${(_worshipedBy?.getName() ?? "figure")}";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
