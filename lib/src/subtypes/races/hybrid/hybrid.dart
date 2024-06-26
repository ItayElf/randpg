import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../race.dart';

/// A class that represents a hybrid between two other races
class Hybrid implements Race {
  /// The first race this race is hybrid of
  final Race firstRace;

  /// The second race this race is hybrid of
  final Race secondRace;

  /// The name of the hybrid race
  final String raceName;

  /// The plural name of the hybrid race
  final String pluralRaceName;

  final String raceAdjective;

  const Hybrid({
    required this.firstRace,
    required this.secondRace,
    required this.raceName,
    required this.pluralRaceName,
    required this.raceAdjective,
  });

  @override
  Generator<int> getAgeGenerator(Gender gender) => MultipleGenerator([
        firstRace.getAgeGenerator(gender),
        secondRace.getAgeGenerator(gender),
      ]);

  @override
  Generator<Alignment> getAlignmentGenerator() => MultipleGenerator([
        firstRace.getAlignmentGenerator(),
        secondRace.getAlignmentGenerator(),
      ]);

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) => MultipleGenerator([
        firstRace.getBeardGenerator(gender),
        secondRace.getBeardGenerator(gender),
      ]);

  @override
  Generator<String> getBuildGenerator(Gender gender) => MultipleGenerator([
        firstRace.getBuildGenerator(gender),
        secondRace.getBuildGenerator(gender),
      ]);

  @override
  Generator<String> getEyesGenerator(Gender gender) => MultipleGenerator([
        firstRace.getEyesGenerator(gender),
        secondRace.getEyesGenerator(gender),
      ]);

  @override
  Generator<String> getFaceGenerator(Gender gender) => MultipleGenerator([
        firstRace.getFaceGenerator(gender),
        secondRace.getFaceGenerator(gender),
      ]);

  @override
  Generator<Hair> getHairGenerator(Gender gender) => MultipleGenerator([
        firstRace.getHairGenerator(gender),
        secondRace.getHairGenerator(gender),
      ]);

  @override
  Generator<int> getHeightGenerator(Gender gender) => MultipleGenerator([
        firstRace.getHeightGenerator(gender),
        secondRace.getHeightGenerator(gender),
      ]);

  @override
  String getName() => raceName;

  @override
  Generator<String> getNameGenerator(Gender gender) => MultipleGenerator([
        firstRace.getNameGenerator(gender),
        secondRace.getNameGenerator(gender),
      ]);

  @override
  Generator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        firstRace.getPersonalityQuirkGenerator(),
        secondRace.getPersonalityQuirkGenerator(),
      ]);

  @override
  Generator<String> getPersonalityTraitGenerator() => MultipleGenerator([
        firstRace.getPersonalityTraitGenerator(),
        secondRace.getPersonalityTraitGenerator(),
      ]);

  @override
  String getPluralName() => pluralRaceName;

  @override
  Generator<String> getSkinGenerator(Gender gender) => MultipleGenerator([
        firstRace.getSkinGenerator(gender),
        secondRace.getSkinGenerator(gender),
      ]);

  @override
  Generator<String> getSpecialFeatureGenerator(Gender gender) =>
      MultipleGenerator([
        firstRace.getSpecialFeatureGenerator(gender),
        secondRace.getSpecialFeatureGenerator(gender),
      ]);

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        firstRace.getOpinionGenerator(),
        secondRace.getOpinionGenerator(),
      ]);

  @override
  String getAdjective() => raceAdjective;
}
