import '../../../../enums/race.dart';

const strongBuild = [
  'muscular',
  'regular',
  'beefy',
  'massive',
  'round',
  'fat',
];
const lightBuild = [
  'anorexic',
  'skinny',
  'lean',
  'athletic',
  'muscular',
  'regular'
];
const genericBuild = [
  'skinny',
  'lean',
  'athletic',
  'muscular',
  'regular',
  'beefy',
  'round'
];

const strongRaces = [
  Race.dragonborn,
  Race.dwarf,
  Race.orc,
];

const lightRaces = [
  Race.elf,
  Race.tiefling,
];

const buildMap = {
  strongRaces: strongBuild,
  lightRaces: lightBuild,
};
