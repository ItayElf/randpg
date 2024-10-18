import 'dart:math';

import 'package:fast_noise/fast_noise.dart';

import '../base/generator.dart';
import '../base/seed_generator.dart';

class PerlinMapGenerator implements Generator<List<List<double>>> {
  late int _seed;
  final int width;
  final int height;

  static const List<int> _octaves = [3, 6, 12, 24];

  PerlinMapGenerator(this.width, this.height) {
    _seed = SeedGenerator.generate();
  }

  @override
  generate() {
    final results = List.generate(
      height,
      (_) => List.generate(width, (_) => 0.0),
    );

    // Go over each item in the generated noise and scale it by (1/2**index)
    final noises = _octaves.map(
      (o) {
        final scaler = pow(2, -_octaves.indexOf(o));
        return noise2(
          height,
          width,
          seed: _seed + o,
          octaves: o,
          noiseType: NoiseType.perlinFractal,
          frequency: 0.04,
        ).map(
          (row) => row.map((v) => v * scaler),
        );
      },
    );

    for (var noise in noises) {
      var rowIter = noise.iterator;
      for (int y = 0; rowIter.moveNext(); y++) {
        var colIter = rowIter.current.iterator;
        for (int x = 0; colIter.moveNext(); x++) {
          results[y][x] += colIter.current;
        }
      }
    }

    return results;
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
