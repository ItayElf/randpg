import '../../../../enums/race.dart';
import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'face_data.dart';

/// A class that generates faces
class FaceGenerator implements IGenerator<String> {
  late int _seed;
  final Race _race;

  FaceGenerator(this._race) {
    _seed = SeedGenerator.generate();
  }

  /// Generates face for the given race
  @override
  String generate() {
    List<String> pool = regularLookingFace + goodLookingFace;
    for (var entry in faceMap.entries) {
      if (entry.key.contains(_race)) {
        pool = List.from(entry.value);
      }
    }

    final generators = [
      ListItemGenerator(pool),
      ListItemGenerator(faceShape),
    ];

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
