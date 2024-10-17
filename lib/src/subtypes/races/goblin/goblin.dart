import '../../../entities/npcs/alignment.dart';
import '../../../entities/npcs/hair.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/constant_generator.dart';
import '../../../generators/base/generator.dart';
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
  Generator<int> getAgeGenerator(Gender gender) =>
      NumberGenerator(14, _maxAge + 1);

  @override
  Generator<Alignment> getAlignmentGenerator() => GoblinAlignmentGenerator();

  @override
  Generator<Hair?> getBeardGenerator(Gender gender) => ConstantGenerator(null);

  @override
  Generator<String> getBuildGenerator(Gender gender) => LightBuildGenerator();

  @override
  Generator<String> getEyesGenerator(Gender gender) => GoblinEyesGenerator();

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
      GoblinNameGenerator(gender);

  @override
  Generator<String> getOpinionGenerator() => MultipleGenerator([
        BaseOpinionGenerator(),
        GoblinOpinionGenerator(),
      ]);

  @override
  Generator<String> getPersonalityQuirkGenerator() => MultipleGenerator([
        BasePersonalityQuirkGenerator(),
        GoblinPersonalityQuirkGenerator(),
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
}
