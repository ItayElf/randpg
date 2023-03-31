import 'package:randpg/src/races/halfling/halfling.dart';

import 'dragonborn/dragonborn.dart';
import 'dwarf/dwarf.dart';
import 'elf/elf.dart';
import 'gnome/gnome.dart';
import 'human/human.dart';
import 'hybrid/hybrid.dart';

const availableRaces = [
  Dragonborn(),
  Dwarf(),
  Elf(),
  Gnome(),
  Hybrid(
    firstRace: Human(),
    secondRace: Elf(),
    raceName: "Half-elf",
    pluralRaceName: "Half-elves",
  ),
  Halfling(),
  Human(),
];
