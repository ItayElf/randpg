import 'package:randpg/entities/deities.dart';
import 'package:randpg/generators/custom/custom_races.dart';
import 'package:randpg/generators/deities.dart';
import 'package:randpg/subtypes/deities.dart';

void main() {
  // Generating each of the active deity types
  for (DeityType deityType in DeityManager.activeDeityTypes) {
    // Generate a random alignment for the deity
    final alignment = BaseAlignmentGenerator().generate();

    // generates a random deity with the given alignment
    Deity deity = DeityGenerator(deityType, alignment).generate();

    print(deity.toJson());
  }
}
