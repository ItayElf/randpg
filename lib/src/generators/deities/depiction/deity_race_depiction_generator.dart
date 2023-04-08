import '../../../subtypes/races/race.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import 'deity_depiction_data.dart';

/// A class that generates race depictions of deities
class DeityRaceDepictionGenerator implements IGenerator<String> {
  late int _seed;
  final Race _worshipedBy;

  DeityRaceDepictionGenerator(this._worshipedBy) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final generator = ListItemGenerator(deityAnimals);
    generator.seed(_seed);
    final animal = generator.generate();

    return "${_worshipedBy.getName()} with $animal features";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
