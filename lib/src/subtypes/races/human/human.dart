import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/alignment/base_alignment_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/base_beard_generator.dart';
import '../../../generators/npcs/physical/build/base_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/skin/base_skin_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../race.dart';
import 'names/human_name_generator.dart';

/// A class that represents the human race
class Human implements Race {
  const Human();

  static const _raceName = "human";
  static const _pluralRaceName = "humans";
  static const _maxAge = 90;
  static const _minHeight = 148;
  static const _maxHeight = 192;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => BaseAlignmentGenerator();

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
      HumanNameGenerator(gender);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() =>
      BasePersonalityQuirkGenerator();

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
}
