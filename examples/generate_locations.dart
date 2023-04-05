import 'package:randpg/entities/settlements.dart';
import 'package:randpg/generators/generators.dart';
import 'package:randpg/generators/settlements.dart';
import 'package:randpg/subtypes/races.dart';
import 'package:randpg/subtypes/locations.dart';

void main() {
  // Generating each of the active locations
  for (LocationType locationType in LocationManager.activeLocationTypes) {
    // Generate a random race for the owner of the location
    Race race = ListItemGenerator(RaceManager.activeRaces).generate();

    // generates a random location with the given type and race
    Location location = LocationGenerator(locationType, race).generate();

    print(location.toJson());
  }
}
