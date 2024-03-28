import '../../../base/generator.dart';
import '../../../base/list_item_generator.dart';
import '../../../base/seed_generator.dart';
import 'face_data.dart';

/// A class that generates good looking faces
class BaseFaceGenerator implements Generator<String> {
  late int _seed;

  BaseFaceGenerator() {
    _seed = SeedGenerator.generate();
  }

  /// Generates a face
  @override
  String generate() {
    final generators = [
      ListItemGenerator(faceAttributes),
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
