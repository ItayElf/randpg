import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/companions/personality/companion_personality_generator.dart';
import '../companion_type.dart';
import '../dogs/personality/dog_personality_adjective_generator.dart';
import 'appearance/cat_appearance_generator.dart';
import 'names/female_cat_names_generator.dart';
import 'names/male_cat_names_generator.dart';
import 'personality/cat_activity_generator.dart';
import 'quirks/cat_quirk_generator.dart';
import 'skills/cat_skills_generator.dart';

/// A cat companion
class Cat implements CompanionType {
  static const _companionType = "cat";

  @override
  Generator<String> getAppearanceGenerator(String name, Gender gender) =>
      CatAppearanceGenerator(name, gender);

  @override
  String getCompanionType() => _companionType;

  @override
  Generator<String> getNameGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleCatNameGenerator();
      case Gender.female:
        return FemaleCatNameGenerator();
    }
  }

  @override
  Generator<String> getPersonalityGenerator(String name, Gender gender) =>
      CompanionPersonalityGenerator(
        name,
        DogPersonalityAdjectiveGenerator(),
        CatActivityGenerator(),
      );

  @override
  Generator<List<String>> getQuirksGenerator() =>
      UniqueGenerator(CatQuirkGenerator(), 2);

  @override
  Generator<List<String>> getSkillsGenerator() =>
      UniqueGenerator(CatSkillGenerator(), 2);
}
