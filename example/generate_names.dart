import 'dart:math';

import 'package:radnpg/enums/race.dart';
import 'package:radnpg/generators/names/races.dart';

void main() {
  // Generate names for races:
  for (Race race in Race.values) {
    bool isMale = Random().nextBool();
    String name = RaceNameGenerator(isMale, race).generate();
    print("Race: ${race.name}, is male: $isMale, name: $name");
  }
}
