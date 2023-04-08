import '../../../../entities/deities.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/deities/attributes/deity_negative_attribute_generator.dart';
import '../../../generators/deities/attributes/deity_positive_attribute_generator.dart';
import '../../../generators/deities/depiction/deity_animal_depiction_generator.dart';
import '../../../generators/deities/depiction/deity_figure_depiction_generator.dart';
import '../../../generators/deities/domains/deity_domain_generator.dart';
import '../../../generators/deities/names/deity_race_name_generator.dart';
import '../../../generators/deities/shrines/deity_few_shrines_generator.dart';
import '../../../generators/deities/worshipers/deity_few_worshipers_generator.dart';
import '../../../generators/fixable.dart';
import '../../races/race.dart';
import '../deity_type.dart';

/// A class that represents the archangel deity type
class Archangel implements DeityType, Fixable<Deity> {
  const Archangel();

  static const _deityType = "archangel";
  static const _defaultAlignment = Alignment(
    ethical: EthicalAlignment.lawful,
    moral: MoralAlignment.good,
  );

  @override
  String getDeityTitle(Gender gender) => _deityType;

  @override
  String getDeityType() => _deityType;

  @override
  IGenerator<String> getDepictionGenerator(Race? worshipedBy) =>
      DeityFigureDepictionGenerator(null);

  @override
  IGenerator<String> getDomainGenerator(Alignment alignment) =>
      DeityDomainGenerator(_defaultAlignment);

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
  IGenerator<Race?> getWorshipedByGenerator() => ListItemGenerator([null]);

  @override
  IGenerator<String> getWorshipersGenerator() => DeityFewWorshipersGenerator();

  @override
  Deity getFixed(Deity deity) {
    return deity.copyWith(alignment: _defaultAlignment);
  }
}