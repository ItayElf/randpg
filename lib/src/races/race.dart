import '../entities/npcs/alignment.dart';
import '../entities/npcs/hair.dart';
import '../enums/gender.dart';
import '../generators/base/generator.dart';

/// An interface for races
abstract class Race {
  /// A method that returns a generator that generates a name for a character from this race
  IGenerator<String> getNameGenerator(Gender gender);

  /// A method that returns a generator for an age for a character from this race
  IGenerator<int> getAgeGenerator(Gender gender);

  /// A method that returns a generator for an hairstyle for a character from this race
  IGenerator<Hair> getHairGenerator(Gender gender);

  /// A method that returns a generator for eyes for a character from this race
  IGenerator<String> getEyesGenerator(Gender gender);

  /// A method that returns a generator for a skin for a character from this race
  IGenerator<String> getSkinGenerator(Gender gender);

  /// A method that returns a generator for a height for a character from this race
  IGenerator<int> getHeightGenerator(Gender gender);

  /// A method that returns a generator for a build for a character from this race
  IGenerator<String> getBuildGenerator(Gender gender);

  /// A method that returns a generator for a face for a character from this race
  IGenerator<String> getFaceGenerator(Gender gender);

  /// A method that returns a generator for a beard for a character from this race
  IGenerator<Hair?> getBeardGenerator(Gender gender);

  /// A method that returns a generator for special features for a character from this race
  IGenerator<List<String>> getSpecialFeaturesGenerator(Gender gender);

  /// A method that returns a generator for an alignment for a character from this race
  IGenerator<Alignment> getAlignmentGenerator();

  /// A method that returns a generator for personality traits for a character from this race
  IGenerator<List<String>> getPersonalityTraitsGenerator();

  /// A method that returns a generator for personality quirks for a character from this race
  IGenerator<List<String>> getPersonalityQuirksGenerator();
}
