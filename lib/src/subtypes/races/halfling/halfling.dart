import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/base_beard_generator.dart';
import '../../../generators/npcs/physical/build/base_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/skin/base_skin_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import 'alignment/halfling_alignment_generator.dart';
import 'names/halfling_name_generator.dart';
import 'opinions/halfling_opinion_generator.dart';
import 'quirks/halfling_quirks_generator.dart';

/// A class that represents the halfling race
class Halfling implements Race {
  const Halfling();

  static const _raceName = "halfling";
  static const _pluralRaceName = "halflings";
  static const _raceAdjective = "halfling";
  static const _maxAge = 150;
  static const _minHeight = 85;
  static const _maxHeight = 129;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => HalflingAlignmentGenerator();

  @override
  IGenerator<Hair?> getBeardGenerator(Gender gender) =>
      BaseBeardGenerator(gender);

  @override
  IGenerator<String> getBuildGenerator(Gender gender) => BaseBuildGenerator();

  @override
  IGenerator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  IGenerator<String> getFaceGenerator(Gender gender) => BaseFaceGenerator();

  @override
  IGenerator<Hair> getHairGenerator(Gender gender) => BaseHairGenerator(gender);

  @override
  IGenerator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight + 1);

  @override
  String getName() => _raceName;

  @override
  IGenerator<String> getNameGenerator(Gender gender) =>
      HalflingNameGenerator(gender);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        HalflingPersonalityQuirkGenerator(),
      ]);

  @override
  IGenerator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  IGenerator<String> getSkinGenerator(Gender gender) => BaseSkinGenerator();

  @override
  IGenerator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();

  @override
  IGenerator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        HalflingOpinionGenerator(),
      ]);

  @override
  String getAdjective() => _raceAdjective;
}
