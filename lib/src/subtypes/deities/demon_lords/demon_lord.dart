import '../../../../entities/deities.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/deities/attributes/deity_negative_attribute_generator.dart';
import '../../../generators/deities/attributes/deity_positive_attribute_generator.dart';
import '../../../generators/deities/depiction/deity_being_depiction_generator.dart';
import '../../../generators/deities/names/deity_race_name_generator.dart';
import '../../../generators/deities/shrines/deity_few_shrines_generator.dart';
import '../../../generators/deities/worshipers/deity_few_worshipers_generator.dart';
import '../../../generators/fixable.dart';
import '../../../randpg_exceptions.dart';
import '../../races/race.dart';
import '../deity_type.dart';
import 'domains/demon_lord_domain_generator.dart';

/// A class that represents the demon-lord deity type
class DemonLord implements DeityType, Fixable<Deity> {
  const DemonLord();

  static const _deityType = "demon lord";
  static const _deityTitles = {
    Gender.male: "demon lord",
    Gender.female: "demon queen",
  };

  static const _defaultAlignment = Alignment(
    ethical: EthicalAlignment.chaotic,
    moral: MoralAlignment.evil,
  );

  @override
  String getDeityTitle(Gender? gender) {
    if (_deityTitles.containsKey(gender)) {
      return _deityTitles[gender]!;
    }
    throw GenderNotSupportedException("Gender $gender is not supported");
  }

  @override
  String getDeityType() => _deityType;

  @override
  IGenerator<String> getDepictionGenerator(Race? worshipedBy) =>
      DeityBeingDepictionGenerator(null);

  @override
  IGenerator<String> getDomainGenerator(Alignment? alignment) =>
      DemonLordsDomainGenerator();

  @override
  IGenerator<Gender> getGenderGenerator() => ListItemGenerator(Gender.values);

  @override
  IGenerator<String> getNameGenerator(Gender? gender, Race? worshipedBy) =>
      DeityRaceNameGenerator(gender, worshipedBy);

  @override
  IGenerator<String> getNegativeAttributeGenerator() =>
      DeityNegativeAttributeGenerator();

  @override
  IGenerator<String> getPositiveAttributeGenerator() =>
      DeityPositiveAttributeGenerator();

  @override
  IGenerator<String> getShrinesRarityGenerator() => DeityFewShrinesGenerator();

  @override
  IGenerator<Race?> getWorshipedByGenerator() => ListItemGenerator([null]);

  @override
  IGenerator<String> getWorshipersGenerator() => DeityFewWorshipersGenerator();

  @override
  Deity getFixed(Deity deity) {
    return deity.copyWith(alignment: _defaultAlignment);
  }
}
