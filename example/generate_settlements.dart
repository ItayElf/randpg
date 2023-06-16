import 'package:randpg/entities/races.dart';
import 'package:randpg/entities/settlements.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generating each of the active settlements
  for (SettlementType settlementType in SettlementManager().activeTypes) {
    // Generate a random race (or null) for the dominant race in the settlement
    Race? dominantRace = ListItemGenerator([
      ...RaceManager().activeTypes,
      null,
    ]).generate();

    // generates a random settlement with the given type and race
    Settlement settlement =
        SettlementGenerator(settlementType, dominantRace).generate();

    print(settlement.toJson());
  }
}
