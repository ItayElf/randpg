import 'package:randpg/entities/locations.dart';
import 'package:randpg/entities/races.dart';
import 'package:randpg/entities/settlements.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generating each of the active locations
  for (LocationType locationType in LocationManager().activeTypes) {
    // Generate a random race for the owner of the location
    Race race = ListItemGenerator(RaceManager().activeTypes).generate();

    // generates a random location with the given type and race
    Location location = LocationGenerator(locationType, race).generate();

    print(location.toJson());
  }
}
