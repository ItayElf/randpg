import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/base_beard_generator.dart';
import '../../../generators/npcs/physical/build/light_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import 'alignment/tiefling_alignment_generator.dart';
import 'hair/tiefling_hair_generator.dart';
import 'names/tiefling_name_generator.dart';
import 'opinions/tiefling_opinion_generator.dart';
import 'skin/tiefling_skin_generator.dart';

/// A class that represents the tiefling race
class Tiefling implements Race {
  const Tiefling();

  static const _raceName = "tiefling";
  static const _pluralRaceName = "tieflings";
  static const _raceAdjective = "tiefling";
  static const _maxAge = 100;
  static const _minHeight = 148;
  static const _maxHeight = 192;

  @override
  Generator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  Generator<Alignment> getAlignmentGenerator() => TieflingAlignmentGenerator();

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) =>
      BaseBeardGenerator(gender);

  @override
  Generator<String> getBuildGenerator(Gender gender) => LightBuildGenerator();

  @override
  Generator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  Generator<String> getFaceGenerator(Gender gender) => BaseFaceGenerator();

  @override
  Generator<Hair> getHairGenerator(Gender gender) =>
      TieflingHairGenerator(gender);

  @override
  Generator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight + 1);

  @override
  String getName() => _raceName;

  @override
  Generator<String> getNameGenerator(Gender gender) =>
      TieflingNameGenerator(gender);

  @override
  Generator<String> getPersonalityQuirkGenerator() =>
      BasePersonalityQuirkGenerator();

  @override
  Generator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  Generator<String> getSkinGenerator(Gender gender) => TieflingSkinGenerator();

  @override
  Generator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        TieflingOpinionGenerator(),
      ]);

  @override
  String getAdjective() => _raceAdjective;
}
