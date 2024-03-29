import 'package:randpg/entities/companions.dart';
import 'package:randpg/enums/gender.dart';
import 'package:randpg/generators.dart';

void main() {
  // Generating each of the active companion types
  for (CompanionType companionType in CompanionManager().activeTypes) {
    // Generate a random gender
    Gender gender = ListItemGenerator(Gender.values).generate();

    // generates a random companion with the given gender
    Companion companion = CompanionGenerator(companionType, gender).generate();

    print(companion.toJson());
  }
}
