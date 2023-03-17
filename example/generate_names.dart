import 'package:randpg/enums/gender.dart';
import 'package:randpg/enums/race.dart';
import 'package:randpg/generators/generators.dart';
import 'package:randpg/generators/names/races.dart';

void main() {
  // Generate names for races:
  for (Race race in Race.values) {
    Gender gender = ListItemGenerator(Gender.values).generate();
    String name = RaceNameGenerator(gender, race).generate();
    print("Race: ${race.name}, gender: ${gender.name}, name: $name");
  }
}
