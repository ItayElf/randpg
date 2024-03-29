import 'package:randpg/src/subtypes/companions/dogs/personality/dog_activity_generator.dart';
import 'package:randpg/src/subtypes/companions/dogs/personality/dog_personality_adjective_generator.dart';

import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/companions/personality/companion_personality_generator.dart';
import '../companion_type.dart';
import 'appearance/dog_appearance_generator.dart';
import 'names/female_dog_name_generator.dart';
import 'names/male_dog_name_generator.dart';
import 'quirks/dog_quirk_generator.dart';
import 'skills/dog_skill_generator.dart';

/// A dog companion
class Dog implements CompanionType {
  static const _companionType = "dog";

  @override
  Generator<String> getAppearanceGenerator(String name, Gender gender) =>
      DogAppearanceGenerator(name, gender);

  @override
  String getCompanionType() => _companionType;

  @override
  Generator<String> getNameGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleDogNameGenerator();
      case Gender.female:
        return FemaleDogNameGenerator();
    }
  }

  @override
  Generator<String> getPersonalityGenerator(String name, Gender gender) =>
      CompanionPersonalityGenerator(
        name,
        DogPersonalityAdjectiveGenerator(),
        DogActivityGenerator(),
      );

  @override
  Generator<List<String>> getQuirksGenerator() =>
      UniqueGenerator(DogQuirkGenerator(), 2);

  @override
  Generator<List<String>> getSkillsGenerator() =>
      UniqueGenerator(DogSkillGenerator(), 2);
}
