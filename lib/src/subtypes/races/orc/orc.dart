import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/base_beard_generator.dart';
import '../../../generators/npcs/physical/build/strong_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import '../settlement_nameable.dart';
import 'alignment/orc_alignment_generator.dart';
import 'names/orc_name_generator.dart';
import 'opinions/orc_opinion_generator.dart';
import 'quirks/orc_quirks_generator.dart';
import 'settlement_names/orcish_settlement_name_generator.dart';
import 'skin/orc_skin_generator.dart';

/// A class that represents the orc race
class Orc implements Race, SettlementNameable {
  const Orc();

  static const _raceName = "orc";
  static const _pluralRaceName = "orcs";
  static const _raceAdjective = "orcish";
  static const _maxAge = 100;
  static const _minHeight = 163;
  static const _maxHeight = 207;

  @override
  Generator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  Generator<Alignment> getAlignmentGenerator() => OrcAlignmentGenerator();

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) =>
      BaseBeardGenerator(gender);

  @override
  Generator<String> getBuildGenerator(Gender gender) => StrongBuildGenerator();

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
  Generator<String> getNameGenerator(Gender gender) => OrcNameGenerator(gender);

  @override
  Generator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        OrcPersonalityQuirkGenerator(),
      ]);

  @override
  Generator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  Generator<String> getSkinGenerator(Gender gender) => OrcSkinGenerator();

  @override
  Generator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        OrcOpinionGenerator(),
      ]);

  @override
  Generator<String> getSettlementNameGenerator() =>
      OrcishSettlementNameGenerator();

  @override
  String getAdjective() => _raceAdjective;
}
