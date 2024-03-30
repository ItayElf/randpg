import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/settlements/locations/building_description/base_description_generator.dart';
import '../../../generators/settlements/locations/outside_description/base_outsize_description_generator.dart';
import '../../../generators/settlements/locations/zone/base_zone_generator.dart';
import '../location_type.dart';
import 'goods/temple_goods_generator.dart';
import 'names/temple_name_generator.dart';

/// A class that represents the temple location type
class Temple implements LocationType {
  const Temple();

  static const _locationType = "temple";
  static const _ownerOccupation = "priest";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      BaseDescriptionGenerator(locationType, locationName);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => TempleServicesGenerator();

  @override
  String getLocationType() => _locationType;

  @override
  Generator<String> getNameGenerator(Npc owner) => TempleNameGenerator();

  @override
  Generator<String> getOutsideDescription() =>
      BaseOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  Generator<String> getZoneGenerator() => BaseZoneGenerator();
}
