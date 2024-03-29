import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../companion_type.dart';
import 'appearance/bird_appearance_generator.dart';
import 'names/female_bird_name_generator.dart';
import 'names/male_bird_name_generator.dart';

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
  Generator<String> getPersonalityGenerator(String name, Gender gender) {
    // TODO: implement getPersonalityGenerator
    throw UnimplementedError();
  }

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
