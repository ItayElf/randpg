import '../../../../enums/race.dart';

const genericPersonalityQuirks = [
  'has a constant wanderlust and is unable to live at the same place for more than a few months.',
  "doesn't like change.",
  'frequently quotes proverbs.',
  'frequently misquotes proverbs.',
  'falls in and out of love easily.',
  'believes in soulmates.',
  'is always joking, even at inappropriate times.',
  'has a joke for every situation.',
  "doesn't like listening to jokes.",
  'is constantly flattering people.',
  'is a compulsive gambler.',
  'is an alcoholic.',
  'frequently lies.',
  'believes in whatever deity is most helpful at a given moment.',
  'is kleptomaniac.',
  'always does what told not to.',
  'gets very mad at any semblance of an insult.',
  'has a story for everything.',
  'sees insults as an art.',
  'is a cross-dresser.',
  'runs everywhere instead of walking.',
  'dreams of becoming rich and famous.',
  'admires the local lord.',
  'knows all the gossip around town.',
  'is always sharing wisdom.',
  'believes in destiny.',
  'argues about everything.',
  'spaces out often, lost in thought.',
  'makes anyone in a conversation with to feel like the most important person in the world.',
  'cares about friends and will do anything for them.',
  'reads any available book.',
  'loves discovering new mysteries and solving them.',
  'wants to know every side of a story before expressing an opinion.',
  'is slightly paranoid.',
  'works hard to play hard afterwards.',
  'stretches the truth to tell a good story.',
  'is haunted by horrible memories.',
  'has lost many friends.',
  'has a crude sense of humour.',
  'likes finding direct solutions to problems.',
  'always carries food in the pockets.',
  'frequently asks questions.',
  'is a local sport champion.',
  'frequently laughs at inappropriate times.',
  'believes that all dwarves are planning to destroy the world.',
  'believes that all orcs are planning to destroy the world.',
  'believes that all elves are planning to destroy the world.',
  'believes that all tieflings are planning to destroy the world.',
  'goes out at night secretly looking for weapons.',
  'owns a box full of dead animals.',
  'sets up local dance clubs.',
  'lies poorly on purpose.',
  'collects cute rocks.',
  'collects sea shells.',
  'collects tiny animal skulls.',
  'secretly wants to become the ruler of the city.',
  'has a dragon hatchling companion.',
  'has a pigeon companion.',
  'has a mouse companion.',
  'has a fox companion.',
  'has a parrot companion.',
  'likes to swim.',
  'has a beautiful singing voice.',
  'frequently thinks aloud.'
];

const dragonbornQuirks = [
  'never asks for help.',
  'sees other races as inferior.',
  'keeps all of the promises.',
  'despises fear and cowardice.',
  'treats adversaries with respect.',
  'values honor above all.',
  'cannot use the breath weapon.',
  'has a secret dragon master.',
  'values the clan above anything else.'
];

const dwarfQuirks = [
  'always has a good ale at hand.',
  'feels ill at ease in open spaces.',
  'is more comfortable underground.',
  'frequently hums old dwarven songs.',
  'misses the world as it used to be.',
  'is strongly rooted within tradition.',
  'will take on any bet while drinking.',
  'is always covered in dirt.',
  'has almost never been above ground.',
  'doesn\'t feel comfortable when away from an axe.',
  'is always seen sharpening an axe.',
  'cannot take a halfling seriously.',
  'harbours a deep hatred of orcs and goblins.',
  'has gem-cutting as a hobby.',
  'is secretly captivated by elves.'
];

const elfQuirks = [
  'is disgusted by human architecture.',
  'feels more comfortable while surrounded by nature.',
  'is secretly captivated by dwarves.',
  'has a deep knowledge of ancient secrets.',
  'has a deep knowledge of ancient magic.',
  'knows the name of all the local plants.',
  'will only speak common if absolutely forced to.',
  'never knows the current time and date.',
  'paints stunning paintings in the spare time.',
  'occasionally uses terms from a different language while speaking.',
  'is always late.',
  'has never declared himself an adult.',
  'is deeply xenophobic.'
];

const gnomeQuirks = [
  'makes the best out of any situation.',
  'is always tinkering in the free time.',
  'has a solution for everything.',
  'explains everything in great detail.',
  'has a fascination with explosions.',
  'never stops talking.',
  'complicates simple situations.',
  'is always scribbling notes.',
  'keeps a very precise journal.',
  'always has plans for a new invention.',
  'loves shiny objects.',
  'has a fascination with alchemy.',
  'is fascinated by magic and its history.',
  'is way too curious.',
  'talks so fast that it is very difficult to understand.'
];

const orcQuirks = [
  'only respects powerful and competent leaders.',
  "openly mocks human society's structure.",
  'occasionally challenges others to duels to the death.',
  'will turn anything into an opportunity for training.',
  'enjoys messing with other humanoids with smeller stature.',
  'dislikes depending on others.',
  'maintains a friendly relationships with nearby trolls.'
];

const halflingQuirks = [
  'tries to stay home as much as possible.',
  'usually tries not to get noticed.',
  'is very shy.',
  'has several pet animals.',
  'rides a pony everywhere.',
  'always has a good joke to tell.',
  'knows all there is to know about farms.',
  'lived the early years in a caravan.',
  'never goes anywhere without the best friend.',
  'smiles constantly.',
  'values the community very highly.'
];

const personalityQuirksMap = {
  [Race.dragonborn]: dragonbornQuirks,
  [Race.dwarf]: dwarfQuirks,
  [Race.elf, Race.halfElf]: elfQuirks,
  [Race.gnome]: gnomeQuirks,
  [Race.orc]: orcQuirks,
  [Race.halfling]: halflingQuirks,
};
