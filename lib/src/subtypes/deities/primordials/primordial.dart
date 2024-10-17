import '../../../entities/deities/deity.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/constant_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/deities/attributes/deity_negative_attribute_generator.dart';
import '../../../generators/deities/attributes/deity_positive_attribute_generator.dart';
import '../../../generators/deities/names/deity_race_name_generator.dart';
import '../../../generators/fixable.dart';
import '../../../exceptions/not_found_exceptions.dart';
import '../../races/race.dart';
import '../deity_type.dart';
import 'depictions/primordial_depiction_generator.dart';
import 'domains/primordial_domains_generator.dart';
import 'shrines/primordial_shrines_generator.dart';
import 'worshipers/primordial_worshipers_generator.dart';

/// A class that represents the primordial deity type
class Primordial implements DeityType, Fixable<Deity> {
  const Primordial();

  static const _deityType = "primordial";
  static const _deityTitles = {
    null: "primordial",
  };

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
  Generator<String> getDepictionGenerator(Race? worshipedBy) =>
      PrimordialDepictionGenerator();

  @override
  Generator<String> getDomainGenerator(Alignment? alignment) =>
      PrimordialDomainGenerator();

  @override
  Generator<Gender?> getGenderGenerator() => ConstantGenerator(null);

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
  Generator<String> getShrinesRarityGenerator() => PrimordialShrinesGenerator();

  @override
  Generator<Race?> getWorshipedByGenerator() => ConstantGenerator(null);

  @override
  Generator<String> getWorshipersGenerator() => PrimordialWorshipersGenerator();

  @override
  Deity getFixed(Deity deity) {
    final map = deity.toMap();
    map["alignment"] = null;
    return Deity.fromMap(map);
  }
}
