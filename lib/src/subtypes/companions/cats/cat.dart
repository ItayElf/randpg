import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../companion_type.dart';
import 'appearance/cat_appearance_generator.dart';
import 'names/female_cat_names_generator.dart';
import 'names/male_cat_names_generator.dart';

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
