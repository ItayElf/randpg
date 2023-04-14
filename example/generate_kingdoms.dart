import 'package:randpg/entities/kingdoms.dart';
import 'package:randpg/entities/races.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generate a random race for the race of the kingdom
  Race race = ListItemGenerator(RaceManager.activeRaces).generate();

  // generates a random kingdom with the default type and the random race
  Kingdom kingdom = KingdomGenerator(DefaultKingdomType(), race).generate();

  print(kingdom.toJson());
}
