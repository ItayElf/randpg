import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/alignment/base_alignment_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/beard/long_beard_generator.dart';
import '../../../generators/npcs/physical/build/strong_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/skin/base_skin_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import '../settlement_nameable.dart';
import 'names/dwarf_name_generator.dart';
import 'opinions/dwarf_opinion_generator.dart';
import 'quirks/dwarf_quirks_generator.dart';
import 'settlement_names/dwarven_settlement_name_generator.dart';

/// A class that represents the dwarf race
class Dwarf implements Race, SettlementNameable {
  const Dwarf();

  static const _raceName = "dwarf";
  static const _pluralRaceName = "dwarfs";
  static const _maxAge = 350;
  static const _minHeight = 110;
  static const _maxHeight = 154;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => BaseAlignmentGenerator();

  @override
  IGenerator<Hair?> getBeardGenerator(Gender gender) =>
      LongBeardGenerator(gender);

  @override
  IGenerator<String> getBuildGenerator(Gender gender) => StrongBuildGenerator();

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
      DwarfNameGenerator(gender);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        DwarfPersonalityQuirkGenerator(),
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
        DwarfOpinionGenerator(),
      ]);

  @override
  IGenerator<String> getSettlementNameGenerator() =>
      DwarvenSettlementNameGenerator();
}
