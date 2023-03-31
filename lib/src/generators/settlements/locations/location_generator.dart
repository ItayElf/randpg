import '../../../entities/npcs/npc.dart';
import '../../../entities/settlements/goods.dart';
import '../../../entities/settlements/location.dart';
import '../../../subtypes/locations/location_type.dart';
import '../../../subtypes/races/race.dart';
import '../../base/batch_generator.dart';
import '../../base/generator.dart';
import '../../base/list_item_generator.dart';
import '../../base/seed_generator.dart';
import '../../base/unique_generator.dart';
import '../../npcs/npc_generator.dart';

/// A class that generates locations based on [_locationType]
class LocationGenerator implements IGenerator<Location> {
  late int _seed;
  final LocationType _locationType;
  final Race _ownerRace;

  static const _numberOfOutsideDescriptions = 2;

  LocationGenerator(this._locationType, this._ownerRace) {
    _seed = SeedGenerator.generate();
  }

  @override
  Location generate() {
    final ownerGenerator = NpcGenerator(_ownerRace);
    ownerGenerator.seed(_seed);
    final owner = ownerGenerator.generate().copyWith(
          occupation: _locationType.getOwnerOccupation(),
        );

    final generator = BatchGenerator(_getBatch(_locationType, owner));
    generator.seed(_seed);
    final result = generator.generate();
    if (result["goods"]) {
      result["goods"] = (result["goods"] as List<Goods>)
          .map((goods) => goods.toMap())
          .toList();
    }
    return Location.fromMap(result);
  }

  Map<String, IGenerator> _getBatch(LocationType locationType, Npc owner) => {
        "name": locationType.getNameGenerator(owner),
        "owner": ListItemGenerator([owner]),
        "type": ListItemGenerator([locationType.getLocationType()]),
        "zone": locationType.getZoneGenerator(),
        "outsideDescription": UniqueGenerator(
          locationType.getOutsideDescription(),
          _numberOfOutsideDescriptions,
        ),
        "buildingDescription":
            locationType.getBuildingDescriptionGenerator(owner),
        "goods": locationType.getGoodsGenerator(),
      };

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
