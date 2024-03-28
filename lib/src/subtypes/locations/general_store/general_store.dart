import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/settlements/locations/building_description/base_description_generator.dart';
import '../../../generators/settlements/locations/building_description/two_story_description_generator.dart';
import '../../../generators/settlements/locations/names/owner_building_name_generator.dart';
import '../../../generators/settlements/locations/outside_description/base_outsize_description_generator.dart';
import '../../../generators/settlements/locations/zone/base_zone_generator.dart';
import '../location_type.dart';
import 'goods/store_goods_generator.dart';
import '../../../generators/settlements/locations/names/description_location_name_generator.dart';

/// A class that represents the general store location type
class GeneralStore implements LocationType {
  const GeneralStore();

  static const _locationType = "general shop";
  static const _ownerOccupation = "vendor";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      MultipleGenerator([
        BaseDescriptionGenerator(locationType, locationName),
        TwoStoryDescriptionGenerator(locationType, locationName),
      ]);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => StoreGoodsGenerator();

  @override
  String getLocationType() => _locationType;

  @override
  Generator<String> getNameGenerator(Npc owner) => MultipleGenerator([
        DescriptionLocationNameGenerator(),
        OwnerBuildingNameGenerator(owner.name, _locationType),
      ]);

  @override
  Generator<String> getOutsideDescription() =>
      BaseOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  Generator<String> getZoneGenerator() => BaseZoneGenerator();
}
