import 'package:radnpg/enums/gender.dart';
import 'package:radnpg/enums/race.dart';
import 'package:radnpg/generators/generators.dart';
import 'package:radnpg/generators/names/races.dart';

void main() {
  // Generate names for races:
  for (Race race in Race.values) {
    Gender gender = ListItemGenerator(Gender.values).generate();
    String name = RaceNameGenerator(gender, race).generate();
    print("Race: ${race.name}, gender: ${gender.name}, name: $name");
  }
}
