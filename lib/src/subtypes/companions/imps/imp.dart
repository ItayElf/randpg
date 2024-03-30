import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../companion_type.dart';
import 'appearance/imp_appearance_generator.dart';
import 'names/female_imp_name_generator.dart';
import 'names/male_imp_name_generator.dart';

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
