import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/companions/personality/companion_personality_generator.dart';
import '../companion_type.dart';
import '../dogs/personality/dog_personality_adjective_generator.dart';
import 'appearance/bird_appearance_generator.dart';
import 'names/female_bird_name_generator.dart';
import 'names/male_bird_name_generator.dart';
import 'personality/bird_activity_generator.dart';
import 'quirks/bird_quirk_generator.dart';
import 'skills/bird_skill_generator.dart';

/// A bird companion
class Bird implements CompanionType {
  static const _companionType = "bird";

  @override
  Generator<String> getAppearanceGenerator(String name, Gender gender) =>
      BirdAppearanceGenerator(name, gender);

  @override
  String getCompanionType() => _companionType;

  @override
  Generator<String> getNameGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleBirdNameGenerator();
      case Gender.female:
        return FemaleBirdNameGenerator();
    }
  }

  @override
  Generator<String> getPersonalityGenerator(String name, Gender gender) =>
      CompanionPersonalityGenerator(
        name,
        DogPersonalityAdjectiveGenerator(),
        BirdActivityGenerator(),
      );

  @override
  Generator<List<String>> getQuirksGenerator() =>
      UniqueGenerator(BirdQuirkGenerator(), 2);

  @override
  Generator<List<String>> getSkillsGenerator() =>
      UniqueGenerator(BirdSkillGenerator(), 2);
}
