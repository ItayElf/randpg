import '../../../entities/deities/deity.dart';
import '../../../entities/npcs/alignment.dart';
import '../../../enums/gender.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
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
  IGenerator<String> getDepictionGenerator(Race? worshipedBy) =>
      PrimordialDepictionGenerator();

  @override
  IGenerator<String> getDomainGenerator(Alignment? alignment) =>
      PrimordialDomainGenerator();

  @override
  IGenerator<Gender?> getGenderGenerator() => ListItemGenerator([null]);

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
  IGenerator<String> getShrinesRarityGenerator() =>
      PrimordialShrinesGenerator();

  @override
  IGenerator<Race?> getWorshipedByGenerator() => ListItemGenerator([null]);

  @override
  IGenerator<String> getWorshipersGenerator() =>
      PrimordialWorshipersGenerator();

  @override
  Deity getFixed(Deity deity) {
    final map = deity.toMap();
    map["alignment"] = null;
    return Deity.fromMap(map);
  }
}
