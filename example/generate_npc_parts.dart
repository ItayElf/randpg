import 'package:randpg/entities/npcs.dart';
import 'package:randpg/enums/gender.dart';
import 'package:randpg/enums/race.dart';
import 'package:randpg/generators/npcs.dart';

void main() {
  // Generate male half-elf physical description:
  final generator = PhysicalDescriptionGenerator(Gender.male, Race.halfElf);

  PhysicalDescription description = generator.generate();
  print(description.toJson());
}
