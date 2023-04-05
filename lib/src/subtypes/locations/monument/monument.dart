import 'package:randpg/src/strings_manipulations.dart';

import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../generators/base/future_generator.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
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
  IGenerator<String> getBuildingDescriptionGenerator(
          String locationType, String locationName, Npc owner) =>
      MonumentDescriptionGenerator(owner.name, locationName);

  @override
  IGenerator<List<Goods>?> getGoodsGenerator() => ListItemGenerator([null]);

  @override
  String getLocationType() => _locationType;

  @override
  IGenerator<String> getNameGenerator(Npc owner) =>
      FutureGenerator(ListItemGenerator(monumentType), titledEach);

  @override
  IGenerator<String> getOutsideDescription() =>
      MonumentOutsideDescriptionGenerator();

  @override
  String getOwnerOccupation() => _ownerOccupation;

  @override
  IGenerator<String> getZoneGenerator() => ListItemGenerator(monumentLocation);
}
