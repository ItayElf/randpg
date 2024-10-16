import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/constant_generator.dart ';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/settlements/locations/names/description_location_name_generator.dart';
import '../location_type.dart';
import 'description/monument_description_data.dart';
import 'description/monument_description_generator.dart';
import 'outside_description/monument_outside_description_generator.dart';

/// A class that represents the monument location type
class Monument implements LocationType {
  const Monument();

  static const _locationType = "monument";
  static const _ownerOccupation = "artist";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      MonumentDescriptionGenerator(owner.name);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => ConstantGenerator(null);

  @override
  String getLocationType() => _locationType;

  @override
  Generator<String> getNameGenerator(Npc owner) =>
      DescriptionLocationNameGenerator();

  @override
  Generator<String> getOutsideDescription() =>
      MonumentOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  Generator<String> getZoneGenerator() => ListItemGenerator(monumentLocation);
}
