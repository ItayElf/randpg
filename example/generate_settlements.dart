import 'package:randpg/entities/settlements.dart';
import 'package:randpg/generators/generators.dart';
import 'package:randpg/generators/settlements.dart';
import 'package:randpg/subtypes/races.dart';
import 'package:randpg/subtypes/settlements.dart';

void main() {
  // Generating each of the active settlements
  for (SettlementType settlementType
      in SettlementManager.activeSettlementTypes) {
    // Generate a random race (or null) for the dominant race in the settlement
    Race? dominantRace = ListItemGenerator([
      ...RaceManager.activeRaces,
      null,
    ]).generate();

    // generates a random settlement with the given type and race
    Settlement settlement =
        SettlementGenerator(settlementType, dominantRace).generate();

    print(settlement.toJson());
  }
}
