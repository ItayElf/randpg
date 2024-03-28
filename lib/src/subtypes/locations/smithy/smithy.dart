import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/settlements/locations/building_description/base_description_generator.dart';
import '../../../generators/settlements/locations/names/owner_building_name_generator.dart';
import '../../../generators/settlements/locations/outside_description/base_outsize_description_generator.dart';
import '../../../generators/settlements/locations/zone/base_zone_generator.dart';
import '../location_type.dart';
import 'goods/smithy_goods_generator.dart';

/// A class that represents the smithy location type
class Smithy implements LocationType {
  const Smithy();

  static const _locationType = "smithy";
  static const _ownerOccupation = "blacksmith";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      BaseDescriptionGenerator(locationType, locationName);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => SmithyGoodsGenerator();

  @override
  String getLocationType() => _locationType;

  @override
  Generator<String> getNameGenerator(Npc owner) =>
      OwnerBuildingNameGenerator(owner.name, _locationType);

  @override
  Generator<String> getOutsideDescription() =>
      BaseOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  Generator<String> getZoneGenerator() => BaseZoneGenerator();
}
