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
import 'names/description_store_name_generator.dart';

/// A class that represents the general store location type
class GeneralStore implements LocationType {
  const GeneralStore();

  static const _locationType = "general shop";
  static const _ownerOccupation = "vendor";

  @override
  IGenerator<String> getBuildingDescriptionGenerator(
          String locationType, Npc owner) =>
      MultipleGenerator([
        BaseDescriptionGenerator(),
        TwoStoryDescriptionGenerator(),
      ]);

  @override
  IGenerator<List<Goods>?> getGoodsGenerator() => StoreGoodsGenerator();

  @override
  String getLocationType() => _locationType;

  @override
  IGenerator<String> getNameGenerator(Npc owner) => MultipleGenerator([
        DescriptionStoreNameGenerator(),
        OwnerBuildingNameGenerator(owner.name, _locationType),
      ]);

  @override
  IGenerator<String> getOutsideDescription() =>
      BaseOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  IGenerator<String> getZoneGenerator() => BaseZoneGenerator();
}
