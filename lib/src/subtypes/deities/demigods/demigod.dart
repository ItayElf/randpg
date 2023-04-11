import '../../../entities/npcs/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/deities/attributes/deity_negative_attribute_generator.dart';
import '../../../generators/deities/attributes/deity_positive_attribute_generator.dart';
import '../../../generators/deities/depiction/deity_being_depiction_generator.dart';
import '../../../generators/deities/depiction/deity_race_depiction_generator.dart';
import '../../../generators/deities/domains/deity_domain_generator.dart';
import '../../../generators/deities/names/deity_race_name_generator.dart';
import '../../../generators/deities/shrines/deity_few_shrines_generator.dart';
import '../../../generators/deities/worshipers/deity_few_worshipers_generator.dart';
import '../../../randpg_exceptions.dart';
import '../../races/race.dart';
import '../../races/race_manager.dart';
import '../deity_type.dart';

/// A class that represents the demigod deity type
class Demigod implements DeityType {
  const Demigod();

  static const _deityType = "demigod";
  static const _deityTitles = {
    Gender.male: "demigod",
    Gender.female: "demigoddess",
  };

  @override
  String getDeityTitle(Gender gender) {
    if (_deityTitles.containsKey(gender)) {
      return _deityTitles[gender]!;
    }
    throw GenderNotSupportedException("Gender $gender is not supported");
  }

  @override
  String getDeityType() => _deityType;

  @override
  IGenerator<String> getDepictionGenerator(Race? worshipedBy) =>
      MultipleGenerator([
        DeityBeingDepictionGenerator(worshipedBy),
        if (worshipedBy != null) DeityRaceDepictionGenerator(worshipedBy),
      ]);

  @override
  IGenerator<String> getDomainGenerator(Alignment alignment) =>
      DeityDomainGenerator(alignment);

  @override
  IGenerator<Gender> getGenderGenerator() => ListItemGenerator(Gender.values);

  @override
  IGenerator<String> getNameGenerator(Gender gender, Race? worshipedBy) =>
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
  IGenerator<Race?> getWorshipedByGenerator() => ListItemGenerator([
        ...RaceManager.activeRaces,
        null,
      ]);

  @override
  IGenerator<String> getWorshipersGenerator() => DeityFewWorshipersGenerator();
}
