import 'package:collection/collection.dart';

import '../../../entities/deities/deity.dart';
import '../../../generators/base/generator.dart';
import '../../../generators/base/list_item_generator.dart';
import '../../../generators/base/multiple_generator.dart';
import '../../../generators/base/unique_generator.dart';
import '../../../generators/deities/deity_generator.dart';
import '../../../generators/npcs/occupation/adventurer_occupation_generator.dart';
import '../../../generators/settlements/names/dominant_race_name_generator.dart';
import '../../../generators/world/deities/full_alignment_gods_generator.dart';
import '../../../generators/world/deities/world_deities_batch_generator.dart';
import '../../../generators/world/occupations/world_important_occupation_generator.dart';
import '../../deities/archangels/archangel.dart';
import '../../deities/deity_type.dart';
import '../../deities/demigods/demigod.dart';
import '../../deities/demon_lords/demon_lord.dart';
import '../../deities/primordials/primordial.dart';
import '../../landscapes/landscape_manager.dart';
import '../../landscapes/landscape_type.dart';
import '../../settlements/city/city.dart';
import '../../settlements/hamlet/hamlet.dart';
import '../../settlements/metropolis/metropolis.dart';
import '../../settlements/settlement_type.dart';
import '../../settlements/settlements_manager.dart';
import '../lore/default_lore/default_lore.dart';
import '../lore/world_lore_type.dart';
import '../world_settings.dart';

/// A class that represents the default world settings
class DefaultWorldSettings implements WorldSettings {
  const DefaultWorldSettings();

  static const _settingsName = "default";
  static const _higherDeityType = Primordial();
  static const _higherDeitiesCount = 3;
  static const _importantPeopleCount = 5;
  static const _worldLore = DefaultLore();
  static const Map<DeityType, int> _lesserDeitiesMap = {
    Archangel(): 1,
    DemonLord(): 1,
    Demigod(): 3,
  };
  static const _landscapeTypes = [
    null,
    null,
    null,
    null,
    null,
  ];
  static const _settlementTypes = [
    Metropolis(),
    Metropolis(),
    City(),
    City(),
    City(),
    null,
    null,
    null,
    null,
  ];

  @override
  IGenerator<List<Deity>> getDeitiesGenerator() => FullAlignmentGodsGenerator();

  @override
  IGenerator<List<Deity>> getHigherDeitiesGenerator() => UniqueGenerator(
        DeityGenerator(_higherDeityType, null),
        _higherDeitiesCount,
      );

  @override
  IGenerator<String> getImportantOccupationGenerator() => MultipleGenerator([
        WorldImportantOccupationGenerator(),
        AdventurerOccupationGenerator(),
      ]);

  @override
  int getImportantPeopleCount() => _importantPeopleCount;

  @override
  IGenerator<LandscapeType> getLandscapeTypeGenerator() =>
      ListItemGenerator(LandscapeManager.activeLandscapeTypes);

  @override
  List<LandscapeType?> getLandscapeTypes() => _landscapeTypes;

  @override
  IGenerator<List<Deity>> getLesserDeitiesGenerator() =>
      WorldDeitiesBatchGenerator(_lesserDeitiesMap);

  @override
  IGenerator<String> getNameGenerator() => DominantRaceNameGenerator(null);

  @override
  String getSettingName() => _settingsName;

  @override
  IGenerator<SettlementType> getSettlementTypeGenerator() => ListItemGenerator(
        SettlementManager.activeSettlementTypes
            .whereNot((element) => element is Hamlet)
            .toList(),
      );

  @override
  List<SettlementType?> getSettlementTypes() => _settlementTypes;

  @override
  WorldLoreType getWorldLore() => _worldLore;
}
