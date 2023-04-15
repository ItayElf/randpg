import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/number_generator.dart';
import '../../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../../generators/npcs/physical/build/light_build_generator.dart';
import '../../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../../generators/npcs/physical/face/good_looking_face_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../race.dart';
import '../settlement_nameable.dart';
import 'alignment/elven_alignment_generator.dart';
import 'hair/elven_hair_generator.dart';
import 'names/elf_name_generator.dart';
import 'opinions/elf_opinion_generator.dart';
import 'quirks/elf_quirks_generator.dart';
import 'settlement_names/elven_settlement_name_generator.dart';
import 'skin/elf_skin_generator.dart';

/// A class that represents the elven race
class Elf implements Race, SettlementNameable {
  const Elf();

  static const _raceName = "elf";
  static const _pluralRaceName = "elves";
  static const _maxAge = 750;
  static const _minHeight = 148;
  static const _maxHeight = 192;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(74, _maxAge + 1);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => ElvenAlignmentGenerator();

  @override
  IGenerator<Hair?> getBeardGenerator(Gender gender) =>
      ListItemGenerator([null]);

  @override
  IGenerator<String> getBuildGenerator(Gender gender) => LightBuildGenerator();

  @override
  IGenerator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  IGenerator<String> getFaceGenerator(Gender gender) =>
      GoodLookingFaceGenerator();

  @override
  IGenerator<Hair> getHairGenerator(Gender gender) => ElvenHairGenerator();

  @override
  IGenerator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight + 1);

  @override
  String getName() => _raceName;

  @override
  IGenerator<String> getNameGenerator(Gender gender) =>
      ElfNameGenerator(gender);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        ElfPersonalityQuirkGenerator(),
      ]);

  @override
  IGenerator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  IGenerator<String> getSkinGenerator(Gender gender) => ElfSkinGenerator();

  @override
  IGenerator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();

  @override
  IGenerator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        ElfOpinionGenerator(),
      ]);

  @override
  IGenerator<String> getSettlementNameGenerator() =>
      ElvenSettlementNameGenerator();
}
