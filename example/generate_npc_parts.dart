import 'package:randpg/entities/npcs.dart';
import 'package:randpg/enums/gender.dart';
import 'package:randpg/generators/npcs.dart';

void main() {
  // Generate male half-elf physical description:
  final physicalGenerator =
      PhysicalDescriptionGenerator(Gender.male, Race.halfElf);

  PhysicalDescription description = physicalGenerator.generate();
  print(description.toJson());

  // Generate personality of an orc:
  final personalityGenerator = PersonalityGenerator(Race.orc);

  Personality personality = personalityGenerator.generate();
  print(personality.toJson());
}
