import '../../enums/gender.dart';
import '../../generators/base/generator.dart';

/// A class that represents a generic companion type
abstract class CompanionType {
  /// Returns a generator for the name of the companion
  Generator<String> getNameGenerator(Gender gender);

  /// Returns the name of the companion type
  String getCompanionType();

  /// Returns a generator for the appearance of the companion
  Generator<String> getAppearanceGenerator(String name, Gender gender);

  /// Returns a generator for the personality of the companion
  Generator<String> getPersonalityGenerator(String name, Gender gender);

  /// Returns a generator for the skills of the companion
  Generator<List<String>> getSkillsGenerator();

  /// Returns a generator for the quirks of the companion
  Generator<List<String>> getQuirksGenerator();
}
