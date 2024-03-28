import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/settlements/locations/building_description/base_description_generator.dart';
import '../../../generators/settlements/locations/names/owner_building_name_generator.dart';
import '../../../generators/settlements/locations/outside_description/base_outsize_description_generator.dart';
import '../../../generators/settlements/locations/zone/base_zone_generator.dart';
import '../location_type.dart';
import 'goods/library_books_generator.dart';

/// A class that represents the library location type
class Library implements LocationType {
  const Library();

  static const _locationType = "library";
  static const _ownerOccupation = "librarian";

  @override
  Generator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      BaseDescriptionGenerator(_locationType, locationName);

  @override
  Generator<List<Goods>?> getGoodsGenerator() => LibraryBooksGenerator();

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
