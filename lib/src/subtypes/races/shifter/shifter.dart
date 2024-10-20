import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/alignment/base_alignment_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/base_beard_generator.dart';
import '../../../generators/npcs/physical/build/base_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import 'names/shifter_name_generator.dart';
import 'opinions/shifter_opinion_generator.dart';
import 'quirks/shifter_quirks_generator.dart';
import 'skin/shifter_skin_generator.dart';

class Shifter implements Race {
  const Shifter();

  static const _raceName = "shifter";
  static const _pluralRaceName = "shifters";
  static const _raceAdjective = "shifter";
  static const _maxAge = 90;
  static const _minHeight = 170;
  static const _maxHeight = 214;

  @override
  String getAdjective() => _raceAdjective;

  @override
  Generator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  Generator<Alignment> getAlignmentGenerator() => BaseAlignmentGenerator();

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) =>
      BaseBeardGenerator(gender);

  @override
  Generator<String> getBuildGenerator(Gender gender) => BaseBuildGenerator();

  @override
  Generator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  Generator<String> getFaceGenerator(Gender gender) => BaseFaceGenerator();

  @override
  Generator<Hair> getHairGenerator(Gender gender) => BaseHairGenerator(gender);

  @override
  Generator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight + 1);

  @override
  String getName() => _raceName;

  @override
  Generator<String> getNameGenerator(Gender gender) =>
      ShifterNameGenerator(gender);

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        ShifterOpinionGenerator(),
      ]);

  @override
  Generator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        ShifterPersonalityQuirkGenerator(),
      ]);

  @override
  Generator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  Generator<String> getSkinGenerator(Gender gender) => ShifterSkinGenerator();

  @override
  Generator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();
}
