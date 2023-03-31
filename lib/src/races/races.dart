import 'dragonborn/dragonborn.dart';
import 'dwarf/dwarf.dart';
import 'elf/elf.dart';
import 'gnome/gnome.dart';
import 'halfling/halfling.dart';
import 'human/human.dart';
import 'hybrid/hybrid.dart';
import 'orc/orc.dart';
import 'tiefling/tiefling.dart';

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
  Hybrid(
    firstRace: Human(),
    secondRace: Orc(),
    raceName: "Half-orc",
    pluralRaceName: "Half-orcs",
  ),
  Halfling(),
  Human(),
  Orc(),
  Tiefling(),
];
