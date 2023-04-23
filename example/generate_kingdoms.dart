import 'package:randpg/entities/kingdoms.dart';
import 'package:randpg/entities/races.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generate a kingdom for each of the available government types
  for (GovernmentType governmentType
      in GovernmentTypeManager.activeGovernmentTypes) {
    // Generate a random race for the race of the kingdom
    Race race = ListItemGenerator(RaceManager.activeRaces).generate();

    // generates a random kingdom with the default type, the random race and the government type
    Kingdom kingdom = KingdomGenerator(
      DefaultKingdomType(),
      race,
      governmentType,
    ).generate();

    print(kingdom.toJson());
  }
}
