import '../../../../enums/race.dart';

const baseHeightMinimum = 148;
const baseHeightMaximum = 192;

const heightModifier = {
  Race.dragonborn: 20,
  Race.dwarf: -38,
  Race.gnome: -58,
  Race.halfling: -63,
  Race.orc: 15
};
