import '../../../../entities/races.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/alignment/base_alignment_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/build/strong_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/scales_head_generator.dart';
import '../../../generators/npcs/physical/skin/scales_skin_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import 'names/dragonborn_name_generator.dart';
import 'opinions/dragonborn_opinion_generator.dart';
import 'quirks/dragonborn_quirks_generator.dart';

/// A class that represents the dragonborn race
class Dragonborn implements Race {
  const Dragonborn();

  static const _raceName = "dragonborn";
  static const _pluralRaceName = "dragonborns";
  static const _raceAdjective = "draconic";
  static const _maxAge = 90;
  static const _minHeight = 168;
  static const _maxHeight = 212;

  @override
  Generator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  Generator<Alignment> getAlignmentGenerator() => BaseAlignmentGenerator();

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) =>
      ListItemGenerator([null]);

  @override
  Generator<String> getBuildGenerator(Gender gender) => StrongBuildGenerator();

  @override
  Generator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  Generator<String> getFaceGenerator(Gender gender) => BaseFaceGenerator();

  @override
  Generator<Hair> getHairGenerator(Gender gender) => ScalesHeadGenerator();

  @override
  Generator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight + 1);

  @override
  String getName() => _raceName;

  @override
  Generator<String> getNameGenerator(Gender gender) =>
      DragonbornNameGenerator(gender);

  @override
  Generator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        DragonbornPersonalityQuirkGenerator(),
      ]);

  @override
  Generator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  Generator<String> getSkinGenerator(Gender gender) => ScalesSkinGenerator();

  @override
  Generator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        DragonbornOpinionGenerator(),
      ]);

  @override
  String getAdjective() => _raceAdjective;
}
