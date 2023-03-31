import 'package:randpg/generators/generators.dart';
import 'package:randpg/generators/npcs.dart';
import 'package:randpg/races.dart';

void main() {
  // Generate an npc
  final randomRace = ListItemGenerator(RaceManager.allRaces).generate();
  final generator = NpcGenerator(randomRace);
  print(generator.generate().toJson());
}
