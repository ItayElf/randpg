import '../../entities/npcs/alignment.dart';
import '../../enums/gender.dart';
import '../../generators/base/generator.dart';
import '../races/race.dart';

/// A class that represents a generic deity type
abstract class DeityType {
  /// Returns a generator for the name of the deity
  Generator<String> getNameGenerator(Gender? gender, Race? worshipedBy);

  /// Returns a generator for the gender of the deity
  Generator<Gender?> getGenderGenerator();

  /// Returns the name of the type of the deity
  String getDeityType();

  /// Returns the title of the deity based on its gender (god and goddess, demon and demoness, etc.)
  String getDeityTitle(Gender? gender);

  /// Returns a generator for one domain this being is related to
  Generator<String> getDomainGenerator(Alignment? alignment);

  /// Returns a generator for how this being is depicted
  Generator<String> getDepictionGenerator(Race? worshipedBy);

  /// Returns a generator for the race that worship this being
  Generator<Race?> getWorshipedByGenerator();

  /// Returns a generator for a description of how many worshippers this deity has
  Generator<String> getWorshipersGenerator();

  /// Returns a generator for how rare are shrines for this being
  Generator<String> getShrinesRarityGenerator();

  /// Returns a generator for a positive attribute this being has
  Generator<String> getPositiveAttributeGenerator();

  /// Returns a generator for a negative attribute this being has
  Generator<String> getNegativeAttributeGenerator();
}
