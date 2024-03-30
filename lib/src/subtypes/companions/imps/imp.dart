import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/companions/personality/companion_personality_generator.dart';
import '../companion_type.dart';
import 'appearance/imp_appearance_generator.dart';
import 'names/female_imp_name_generator.dart';
import 'names/male_imp_name_generator.dart';
import 'personality/imp_activity_generator.dart';
import 'personality/imp_personality_adjective_generator.dart';
import 'quirks/imp_quirk_generator.dart';
import 'skills/imp_skill_generator.dart';

class Imp implements CompanionType {
  static const _companionType = "imp";
  @override
  Generator<String> getAppearanceGenerator(String name, Gender gender) =>
      ImpAppearanceGenerator(name, gender);

  @override
  String getCompanionType() => _companionType;

  @override
  Generator<String> getNameGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleImpNameGenerator();
      case Gender.female:
        return FemaleImpNameGenerator();
    }
  }

  @override
  Generator<String> getPersonalityGenerator(String name, Gender gender) =>
      CompanionPersonalityGenerator(
        name,
        ImpPersonalityAdjectiveGenerator(),
        ImpActivityGenerator(),
      );

  @override
  Generator<List<String>> getQuirksGenerator() =>
      UniqueGenerator(ImpQuirkGenerator(), 2);

  @override
  Generator<List<String>> getSkillsGenerator() =>
      UniqueGenerator(ImpSkillGenerator(), 2);
}
