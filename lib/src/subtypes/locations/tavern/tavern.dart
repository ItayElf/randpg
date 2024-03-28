import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/settlements/locations/building_description/two_story_description_generator.dart';
import '../../../generators/settlements/locations/names/description_location_name_generator.dart';
import '../../../generators/settlements/locations/outside_description/base_outsize_description_generator.dart';
import '../../../generators/settlements/locations/zone/base_zone_generator.dart';
import '../location_type.dart';
import 'goods/tavern_goods_generator.dart';

/// A class that represents the tavern location type
class Tavern implements LocationType {
  const Tavern();

  static const _locationType = "tavern";
  static const _ownerOccupation = "innkeeper";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      TwoStoryDescriptionGenerator(locationType, locationName);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => TavernGoodsGenerator();

  @override
  String getLocationType() => _locationType;

  @override
  Generator<String> getNameGenerator(Npc owner) =>
      DescriptionLocationNameGenerator();

  @override
  Generator<String> getOutsideDescription() =>
      BaseOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  Generator<String> getZoneGenerator() => BaseZoneGenerator();
}
