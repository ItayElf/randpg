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
import '../../../generators/npcs/physical/face/base_face_generator.dart';
import '../../../generators/npcs/physical/hair/base_hair_generator.dart';
import '../../../generators/npcs/physical/special_features/base_special_feature_generator.dart';
import '../../../generators/world/opinions/base_opinion_generator.dart';
import '../orc/skin/orc_skin_generator.dart';
import '../race.dart';
import 'alignment/goblin_alignment_generator.dart';
import 'eyes/goblin_eyes_generator.dart';
import 'names/goblin_name_generator.dart';
import 'opinions/goblin_opinions_generator.dart';
import 'quirks/goblin_quirk_generator.dart';

class Goblin implements Race {
  const Goblin();

  static const _raceName = "goblin";
  static const _pluralRaceName = "goblins";
  static const _raceAdjective = "goblin";
  static const _maxAge = 60;
  static const _minHeight = 100;
  static const _maxHeight = 145;

  @override
  String getAdjective() => _raceAdjective;

  @override
  IGenerator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  IGenerator<Alignment> getAlignmentGenerator() => GoblinAlignmentGenerator();

  @override
  IGenerator<Hair?> getBeardGenerator(Gender gender) =>
      ListItemGenerator([null]);

  @override
  IGenerator<String> getBuildGenerator(Gender gender) => LightBuildGenerator();

  @override
  IGenerator<String> getEyesGenerator(Gender gender) => GoblinEyesGenerator();

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
      GoblinNameGenerator(gender);

  @override
  IGenerator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        GoblinOpinionGenerator(),
      ]);

  @override
  IGenerator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        GoblinPersonalityQuirkGenerator(),
      ]);

  @override
  IGenerator<String> getPersonalityTraitGenerator() =>
      BasePersonalityTraitGenerator();

  @override
  String getPluralName() => _pluralRaceName;

  @override
  IGenerator<String> getSkinGenerator(Gender gender) => OrcSkinGenerator();

  @override
  IGenerator<String> getSpecialFeatureGenerator(Gender gender) =>
      BaseSpecialFeatureGenerator();
}
