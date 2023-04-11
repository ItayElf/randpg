import '../../../strings_manipulations.dart';
import '../../../subtypes/races/race.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import 'deity_depiction_data.dart';

/// A class that generates humanoid depictions for deities
class DeityBeingDepictionGenerator implements IGenerator<String> {
  late int _seed;
  final Race? _worshipedBy;

  static const _numberOfDescriptors = 2;

  DeityBeingDepictionGenerator(this._worshipedBy) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = UniqueGenerator(
      ListItemGenerator(deityFeature),
      _numberOfDescriptors,
    );
    generator.seed(_seed);

    return "${article(generator.generate().join(" and "))} ${(_worshipedBy?.getName() ?? "being")}";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
