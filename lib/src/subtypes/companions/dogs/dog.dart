import 'package:randpg/src/subtypes/companions/dogs/names/female_dog_name_generator.dart';
import 'package:randpg/src/subtypes/companions/dogs/names/male_dog_name_generator.dart';
import 'package:randpg/src/subtypes/companions/dogs/personality/dog_personality_generator.dart';

import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../companion_type.dart';
import 'appearance/dog_appearance_generator.dart';

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
      DogPersonalityGenerator(name);

  @override
  Generator<List<String>> getQuirksGenerator() {
    // TODO: implement getQuirksGenerator
    throw UnimplementedError();
  }

  @override
  Generator<List<String>> getSkillsGenerator() {
    // TODO: implement getSkillsGenerator
    throw UnimplementedError();
  }
}
