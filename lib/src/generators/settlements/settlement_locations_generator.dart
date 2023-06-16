import '../../entities/settlements/location.dart';
import '../../subtypes/locations/location_type.dart';
import '../../subtypes/races/race.dart';
import '../../subtypes/races/race_manager.dart';
import '../../subtypes/settlements/settlement_type.dart';
import '../base/generator.dart';
import '../base/list_item_generator.dart';
import '../base/seed_generator.dart';
import '../base/weighted_generator.dart';
import 'locations/location_generator.dart';

/// A class that generates locations for settlements
class SettlementLocationsGenerator implements IGenerator<List<Location>> {
  late int _seed;
  final SettlementType _settlementType;
  final Race? _dominantRace;

  static const _dominantRaceWeight = 7;
  static const _otherRaceWeight = 3;

  SettlementLocationsGenerator(this._settlementType, this._dominantRace) {
    _seed = SeedGenerator.generate();
  }

  @override
  List<Location> generate() {
    final locations = _settlementType.getSettlementsLocations();
    final locationTypes = List.generate(
      locations.length,
      (index) => _getLocationType(
        (_seed + index) % SeedGenerator.maxSeed,
        locations[index],
      ),
    );
    return List.generate(
      locationTypes.length,
      (index) => _generateLocation(
        (_seed + index) % SeedGenerator.maxSeed,
        locationTypes[index],
      ),
    );
  }

  Location _generateLocation(int seed, LocationType locationType) {
    final race = _generateRace(seed);

    final generator = LocationGenerator(locationType, race);
    generator.seed((seed + 1) % SeedGenerator.maxSeed);
    return generator.generate();
  }

  LocationType _getLocationType(int seed, LocationType? locationType) {
    if (locationType != null) {
      return locationType;
    }

    final generator = _settlementType.getLocationsTypeGenerator();
    generator.seed(seed);
    return generator.generate();
  }

  Race _generateRace(int seed) {
    final raceGenerator = ListItemGenerator(RaceManager().activeTypes);
    raceGenerator.seed(seed);
    final race = raceGenerator.generate();

    if (_dominantRace == null) {
      return race;
    }

    final generator = WeightedGenerator({
      _dominantRace!: _dominantRaceWeight,
      race: _otherRaceWeight,
    });
    generator.seed(seed);
    return generator.generate();
  }

  @override
  void seed(int seed) {
    _seed = seed;
  }
}
