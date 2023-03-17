import 'dart:math';

import 'package:radnpg/generators/names/races.dart';

void main() {
  print(DragonbornNameGenerator(Random().nextBool()).generate());
  print(DwarfNameGenerator(Random().nextBool()).generate());
  print(ElfNameGenerator(Random().nextBool()).generate());
  print(GnomeNameGenerator(Random().nextBool()).generate());
  print(HalfElfNameGenerator(Random().nextBool()).generate());
  print(HalflingNameGenerator(Random().nextBool()).generate());
  print(HumanNameGenerator(Random().nextBool()).generate());
  print(OrcNameGenerator(Random().nextBool()).generate());
}
