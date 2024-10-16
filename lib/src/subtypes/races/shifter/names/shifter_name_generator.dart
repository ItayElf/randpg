import '../../../../enums/gender.dart';
import '../../../../generators/base/generator.dart';
import '../../../../generators/base/seed_generator.dart';
import '../../../../strings_manipulations.dart';
import 'female_shifter_name_generator.dart';
import 'male_shifter_name_generator.dart';

class ShifterNameGenerator implements Generator<String> {
  late int _seed;
  final Gender gender;

  ShifterNameGenerator(this.gender) {
    _seed = SeedGenerator.generate();
  }

  @override
  String generate() {
    final descriptive = gender == Gender.female ? "daughter" : "son";
    final generator = gender == Gender.female
        ? FemaleShifterFirstNameGenerator()
        : MaleShifterFirstNameGenerator();
    generator.seed(_seed);
    final firstName = generator.generate();

    generator.seed((_seed * _seed + 1) % SeedGenerator.maxSeed);
    final parentName = generator.generate();

    return "${titled(firstName)} $descriptive of ${titled(parentName)}";
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
