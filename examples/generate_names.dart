import 'package:randpg/enums/gender.dart';
import 'package:randpg/generators/generators.dart';
import 'package:randpg/subtypes/races.dart';

void main() {
  // Generate names for races:
  for (Race race in RaceManager.activeRaces) {
    // Generate a random gender
    Gender gender = ListItemGenerator(Gender.values).generate();

    // generates a random name with the race and the random gender
    String name = race.getNameGenerator(gender).generate();

    print("Race: ${race.getName()}, gender: ${gender.name}, name: $name");
  }
}
