import '../../../../enums/race.dart';

const beardLength = [
  'very short',
  'short',
  'medium',
  'long',
  "",
];

const longBeard = [
  'medium',
  'long',
  'long, braided',
  'very long',
  'very long, braided',
  'gigantic',
  'gigantic, braided'
];

const beardShape = [
  'chinstrap beard',
  'neckbeard',
  'beard',
  'squared beard',
  'goatee',
  'spotty beard',
  'soul patch',
  'handlebar moustache',
  'fu manchu moustache',
  'moustache'
];

const beardMap = {
  [Race.dwarf]: longBeard,
  [Race.elf, Race.dragonborn]: [""],
};
