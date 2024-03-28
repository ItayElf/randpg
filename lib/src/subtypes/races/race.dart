import '../../entities/npcs/alignment.dart';
import '../../entities/npcs/hair.dart';
import '../../enums/gender.dart';
import '../../generators/base/generator.dart';

/// An interface for races
abstract class Race {
  /// Returns the name of the race
  String getName();

  /// Returns the plural name of the race
  String getPluralName();

  /// Returns the adjective of the race
  String getAdjective();

  /// Returns a generator that generates a name for a character from this race
  Generator<String> getNameGenerator(Gender gender);

  /// Returns a generator for an age for a character from this race
  Generator<int> getAgeGenerator(Gender gender);

  /// Returns a generator for an hairstyle for a character from this race
  Generator<Hair> getHairGenerator(Gender gender);

  /// Returns a generator for eyes for a character from this race
  Generator<String> getEyesGenerator(Gender gender);

  /// Returns a generator for a skin for a character from this race
  Generator<String> getSkinGenerator(Gender gender);

  /// Returns a generator for a height for a character from this race
  Generator<int> getHeightGenerator(Gender gender);

  /// Returns a generator for a build for a character from this race
  Generator<String> getBuildGenerator(Gender gender);

  /// Returns a generator for a face for a character from this race
  Generator<String> getFaceGenerator(Gender gender);

  /// Returns a generator for a beard for a character from this race
  Generator<Hair?> getBeardGenerator(Gender gender);

  /// Returns a generator for a special feature for a character from this race
  Generator<String> getSpecialFeatureGenerator(Gender gender);

  /// Returns a generator for an alignment for a character from this race
  Generator<Alignment> getAlignmentGenerator();

  /// Returns a generator for a personality trait for a character from this race
  Generator<String> getPersonalityTraitGenerator();

  /// Returns a generator for a personality quirk for a character from this race
  Generator<String> getPersonalityQuirkGenerator();

  /// Returns a generator for opinions about the race
  Generator<String> getOpinionGenerator();
}
