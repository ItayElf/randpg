import 'package:randpg/entities/npcs.dart';
import 'package:randpg/entities/races.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generate an npc
  final randomRace = ListItemGenerator(RaceManager.activeRaces).generate();
  final generator = NpcGenerator(randomRace);
  print(generator.generate().toJson());
}
