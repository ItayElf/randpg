import '../../../generators/generators.dart';
import '../../../races.dart';
import '../../entities/npcs/alignment.dart';
import '../../entities/npcs/hair.dart';
import '../../enums/gender.dart';
import '../../generators/npcs/personality/alignment/base_alignment_generator.dart';
import '../../generators/npcs/personality/quirks/base_personality_quirk_generator.dart';
import '../../generators/npcs/personality/traits/personality_trait_generator.dart';
import '../../generators/npcs/physical/build/strong_build_generator.dart';
import '../../generators/npcs/physical/eyes/base_eyes_generator.dart';
import '../../generators/npcs/physical/face/base_face_generator.dart';
import '../../generators/npcs/physical/hair/scales_head_generator.dart';
import '../../generators/npcs/physical/skin/scales_skin_generator.dart';
import '../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../race.dart';
import 'names/dragonborn_name_generator.dart';
import 'quirks/dragonborn_quirks_generator.dart';

/// A class that represents the dragonborn race
class Dragonborn implements Race {
  const Dragonborn();

  static const _raceName = "Dragonborn";
  static const _pluralRaceName = "Dragonborns";
  static const _maxAge = 90;
  static const _minHeight = 168;
  static const _maxHeight = 212;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => BaseAlignmentGenerator();

  @override
  IGenerator<Hair?> getBeardGenerator(Gender gender) =>
      ListItemGenerator([null]);

  @override
  IGenerator<String> getBuildGenerator(Gender gender) => StrongBuildGenerator();

  @override
  IGenerator<String> getEyesGenerator(Gender gender) => BaseEyesGenerator();

  @override
  IGenerator<String> getFaceGenerator(Gender gender) => BaseFaceGenerator();

  @override
  IGenerator<Hair> getHairGenerator(Gender gender) => ScalesHeadGenerator();

  @override
  IGenerator<int> getHeightGenerator(Gender gender) =>
      NumberGenerator(_minHeight, _maxHeight);

  @override
  String getName() => _raceName;

  @override
  IGenerator<String> getNameGenerator(Gender gender) =>
      DragonbornNameGenerator(gender);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        DragonbornPersonalityQuirkGenerator(),
      ]);

  @override
  IGenerator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  IGenerator<String> getSkinGenerator(Gender gender) => ScalesSkinGenerator();

  @override
  IGenerator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();
}
