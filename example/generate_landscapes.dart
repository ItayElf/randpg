import 'package:randpg/entities/landscapes.dart';

void main() {
  // Generating each of the active landscapes
  for (LandscapeType landscapeType in LandscapeManager.activeLandscapeTypes) {
    // generates a random landscape with the given type
    Landscape landscape = LandscapeGenerator(landscapeType).generate();

    print(landscape.toJson());
  }
}
