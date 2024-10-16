import '../../../entities/deities/deity.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/constant_generator.dart ';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/deities/attributes/deity_negative_attribute_generator.dart';
import '../../../generators/deities/attributes/deity_positive_attribute_generator.dart';
import '../../../generators/deities/depiction/deity_being_depiction_generator.dart';
import '../../../generators/deities/names/deity_race_name_generator.dart';
import '../../../generators/deities/shrines/deity_few_shrines_generator.dart';
import '../../../generators/deities/worshipers/deity_few_worshipers_generator.dart';
import '../../../generators/fixable.dart';
import '../../races/race.dart';
import '../deity_type.dart';
import 'domains/archangels_domains_generator.dart';

/// A class that represents the archangel deity type
class Archangel implements DeityType, Fixable<Deity> {
  const Archangel();

  static const _deityType = "archangel";
  static const _defaultAlignment = Alignment(
    ethical: EthicalAlignment.lawful,
    moral: MoralAlignment.good,
  );

  @override
  String getDeityTitle(Gender? gender) => _deityType;

  @override
  String getDeityType() => _deityType;

  @override
  Generator<String> getDepictionGenerator(Race? worshipedBy) =>
      DeityBeingDepictionGenerator(null);

  @override
  Generator<String> getDomainGenerator(Alignment? alignment) =>
      ArchangelsDomainGenerator();

  @override
  Generator<Gender> getGenderGenerator() => ListItemGenerator(Gender.values);

  @override
  Generator<String> getNameGenerator(Gender? gender, Race? worshipedBy) =>
      DeityRaceNameGenerator(gender, worshipedBy);

  @override
  Generator<String> getNegativeAttributeGenerator() =>
      DeityNegativeAttributeGenerator();

  @override
  Generator<String> getPositiveAttributeGenerator() =>
      DeityPositiveAttributeGenerator();

  @override
  Generator<String> getShrinesRarityGenerator() => DeityFewShrinesGenerator();

  @override
  Generator<Race?> getWorshipedByGenerator() => ConstantGenerator(null);

  @override
  Generator<String> getWorshipersGenerator() => DeityFewWorshipersGenerator();

  @override
  Deity getFixed(Deity deity) {
    return deity.copyWith(alignment: _defaultAlignment);
  }
}
