import '../../../../entities/companions.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/companions/personality/companion_personality_generator.dart';
import 'appearance/monkey_appearance_generator.dart';
import 'names/female_monkey_names_generator.dart';
import 'names/male_monkey_names_generator.dart';
import 'personality/monkey_activity_generator.dart';
import 'personality/monkey_personality_adjective_generator.dart';
import 'quirks/monkey_quirk_generator.dart';
import 'skills/monkey_skill_generator.dart';

class Monkey implements CompanionType {
  static const _companionType = "monkey";

  @override
  Generator<String> getAppearanceGenerator(String name, Gender gender) =>
      MonkeyAppearanceGenerator(name, gender);

  @override
  String getCompanionType() => _companionType;

  @override
  Generator<String> getNameGenerator(Gender gender) {
    switch (gender) {
      case Gender.male:
        return MaleMonkeyNameGenerator();
      case Gender.female:
        return FemaleMonkeyNameGenerator();
    }
  }

  @override
  Generator<String> getPersonalityGenerator(String name, Gender gender) =>
      CompanionPersonalityGenerator(
        name,
        MonkeyPersonalityAdjectiveGenerator(),
        MonkeyActivityGenerator(),
      );

  @override
  Generator<List<String>> getQuirksGenerator() =>
      UniqueGenerator(MonkeyQuirkGenerator(), 2);

  @override
  Generator<List<String>> getSkillsGenerator() =>
      UniqueGenerator(MonkeySkillGenerator(), 2);
}
