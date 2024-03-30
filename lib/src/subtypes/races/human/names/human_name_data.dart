const humanSurnamePrefix = [
  "axe",
  "glow",
  "blade",
  "blood",
  "bone",
  "cloud",
  "crag",
  "crest",
  "doom",
  "dream",
  "coven",
  "elf",
  "fern",
  "feather",
  "fire",
  "fist",
  "flame",
  "forest",
  "hammer",
  "heart",
  "hell",
  "leaf",
  "light",
  "moon",
  "rage",
  "river",
  "rock",
  "shade",
  "shadow",
  "shield",
  "snow",
  "spirit",
  "star",
  "steel",
  "stone",
  "swift",
  "tree",
  "whisper",
  "wind",
  "wolf",
  "wood",
  "gloom",
  "glory",
  "orb",
  "ash",
  "blaze",
  "amber",
  "autumn",
  "barley",
  "battle",
  "bear",
  "black",
  "blue",
  "boulder",
  "bright",
  "bronze",
  "burning",
  "cask",
  "chest",
  "cinder",
  "clan",
  "claw",
  "clear",
  "cliff",
  "cold",
  "common",
  "crystal",
  "dark",
  "dawn",
  "day",
  "dead",
  "death",
  "deep",
  "dew",
  "dirge",
  "distant",
  "down",
  "dragon",
  "dusk",
  "dust",
  "eagle",
  "earth",
  "ember",
  "even",
  "far",
  "flat",
  "flint",
  "fog",
  "fore",
  "four",
  "free",
  "frost",
  "frozen",
  "full",
  "fuse",
  "gold",
  "horse",
  "gore",
  "grand",
  "gray",
  "grass",
  "great",
  "green",
  "grizzly",
  "hallow",
  "hallowed",
  "hard",
  "hawk",
  "haze",
  "heavy",
  "haven",
  "high",
  "hill",
  "holy",
  "honor",
  "forest",
  "humble",
  "hydra",
  "ice",
  "iron",
  "keen",
  "laughing",
  "lightning",
  "lion",
  "lone",
  "long",
  "low",
  "luna",
  "marble",
  "meadow",
  "mild",
  "mirth",
  "mist",
  "molten",
  "monster",
  "morning",
  "moss",
  "mountain",
  "moon",
  "mourn",
  "mourning",
  "night",
  "noble",
  "nose",
  "oat",
  "ocean",
  "pale",
  "peace",
  "phoenix",
  "pine",
  "plain",
  "pride",
  "proud",
  "pyre",
  "rain",
  "rapid",
  "raven",
  "red",
  "regal",
  "rich",
  "rose",
  "rough",
  "rumble",
  "rune",
  "sacred",
  "sage",
  "saur",
  "sea",
  "serpent",
  "sharp",
  "silent",
  "silver",
  "simple",
  "single",
  "skull",
  "sky",
  "slate",
  "smart",
  "snake",
  "soft",
  "solid",
  "spider",
  "spring",
  "stag",
  "star",
  "stern",
  "still",
  "storm",
  "stout",
  "strong",
  "summer",
  "sun",
  "tall",
  "three",
  "thunder",
  "titan",
  "true",
  "truth",
  "marsh",
  "tusk",
  "twilight",
  "two",
  "void",
  "war",
  "wheat",
  "whit",
  "white",
  "wild",
  "winter",
  "wise",
  "wyvern",
  "young",
  "alpen",
  "crest",
  "crow",
  "fallen",
  "farrow",
  "haven",
  "master",
  "nether",
  "nickle",
  "raven",
  "river",
  "stone",
  "tarren",
  "terra",
  "water",
  "willow",
  "wooden"
];

const humanSurnameSuffix = [
  "axe",
  "glow",
  "beam",
  "blade",
  "blood",
  "bone",
  "cloud",
  "dane",
  "crag",
  "crest",
  "doom",
  "dream",
  "feather",
  "fire",
  "fist",
  "flame",
  "forest",
  "hammer",
  "heart",
  "hell",
  "leaf",
  "light",
  "moon",
  "rage",
  "river",
  "rock",
  "shade",
  "claw",
  "shadow",
  "shield",
  "snow",
  "spirit",
  "star",
  "steel",
  "stone",
  "swift",
  "tree",
  "whisper",
  "wind",
  "wolf",
  "wood",
  "gloom",
  "glory",
  "orb",
  "ash",
  "blaze",
  "arm",
  "arrow",
  "bane",
  "bash",
  "basher",
  "beard",
  "belly",
  "bend",
  "bender",
  "binder",
  "bleeder",
  "blight",
  "bloom",
  "blossom",
  "blower",
  "glade",
  "bluff",
  "bough",
  "bow",
  "brace",
  "braid",
  "branch",
  "brand",
  "breaker",
  "breath",
  "breeze",
  "brew",
  "bringer",
  "brook",
  "brow",
  "caller",
  "chaser",
  "reaper",
  "chewer",
  "cleaver",
  "creek",
  "crusher",
  "cut",
  "cutter",
  "dancer",
  "dew",
  "down",
  "draft",
  "dreamer",
  "drifter",
  "dust",
  "eye",
  "eyes",
  "fall",
  "fang",
  "flare",
  "flaw",
  "flayer",
  "flow",
  "follower",
  "flower",
  "force",
  "forge",
  "fury",
  "gaze",
  "gazer",
  "gem",
  "gleam",
  "glide",
  "grain",
  "grip",
  "grove",
  "guard",
  "gust",
  "hair",
  "hand",
  "helm",
  "hide",
  "horn",
  "hunter",
  "jumper",
  "keep",
  "keeper",
  "killer",
  "lance",
  "lash",
  "less",
  "mane",
  "mantle",
  "mark",
  "maul",
  "maw",
  "might",
  "more",
  "mourn",
  "oak",
  "ore",
  "peak",
  "pelt",
  "pike",
  "punch",
  "reaver",
  "rider",
  "ridge",
  "ripper",
  "roar",
  "run",
  "runner",
  "scar",
  "scream",
  "scribe",
  "seeker",
  "shaper",
  "shard",
  "shot",
  "shout",
  "singer",
  "sky",
  "slayer",
  "snarl",
  "snout",
  "soar",
  "song",
  "sorrow",
  "spark",
  "spear",
  "spell",
  "spire",
  "splitter",
  "sprinter",
  "stalker",
  "steam",
  "stream",
  "strength",
  "stride",
  "strider",
  "strike",
  "striker",
  "sun",
  "surge",
  "sword",
  "sworn",
  "tail",
  "taker",
  "talon",
  "thorn",
  "tide",
  "toe",
  "track",
  "trap",
  "trapper",
  "vale",
  "valor",
  "vigor",
  "walker",
  "ward",
  "watcher",
  "water",
  "weaver",
  "whirl",
  "whisk",
  "winds",
  "wing",
  "woods",
  "wound",
  "brooke",
  "fall",
  "fallow",
  "horn",
  "root",
  "shine",
  "swallow",
  "thorne",
  "willow",
  "wood",
];

const humanFemaleVowel = ["a", "e", "i", "o"];

const humanFemaleNamePrefix = [
  "",
  "",
  "b",
  "c",
  "h",
  "k",
  "l",
  "m",
  "n",
  "r",
  "s",
  "v",
  "w",
  "z"
];

const humanFemaleNameMiddle = [
  "fn",
  "fl",
  "fr",
  "g",
  "l",
  "lg",
  "lr",
  "m",
  "n",
  "r",
  "rh",
  "sh",
  "str",
  "th",
  "thr",
  "v",
  "vr",
];

const humanFemaleNameSuffix = {"": 4, "y": 1};

const humanMaleVowel = {
  "a": 4,
  "e": 4,
  "i": 4,
  "o": 4,
  "oo": 1,
  "ou": 1,
  "au": 1
};

const humanMaleNamePrefix = [
  "b",
  "br",
  "d",
  "dr",
  "f",
  "g",
  "j",
  "k",
  "m",
  "r",
  "s",
  "sh",
  "t",
  "vl",
  "z",
];

const humanMaleNameMiddle = [
  "d",
  "dj",
  "j",
  "lm",
  "ld",
  "lv",
  "m",
  "mz",
  "mv",
  "n",
  "nz",
  "nd",
  "nr",
  "nd",
  "r",
  "rg",
  "rd",
  "rl",
  "rv",
  "rz",
  "sl",
  "sv",
  "sd",
  "th",
  "tv",
  "v",
  "z",
];

const humanMaleNameSuffix = ["c", "d", "k", "r", "s", "sk", "t"];

const humanMaleFirstNames = [
  'aldric',
  'baelor',
  'cedric',
  'darian',
  'eldric',
  'finnian',
  'gareth',
  'hadrian',
  'ivan',
  'jasper',
  'kael',
  'lorcan',
  'matthias',
  'nikolai',
  'orin',
  'percival',
  'quentin',
  'roderick',
  'sebastian',
  'thaddeus',
  'ulric',
  'valerian',
  'wesley',
  'xavier',
  'yorick',
  'zephyr',
  'alistair',
  'benedict',
  'cassius',
  'dorian',
  'emeric',
  'felix',
  'gideon',
  'harrison',
  'ignatius',
  'julian',
  'kieran',
  'lysander',
  'maximilian',
  'nathaniel',
  'oscar',
  'peregrine',
  'quincy',
  'rupert',
  'soren',
  'tristan',
  'ulysses',
  'victor',
  'wynn',
  'xander',
  'yannis',
  'zane',
  'adrian',
  'bartholomew',
  'cyrus',
  'dante',
  'elijah',
  'fabian',
  'gavin',
  'hugo',
  'isaac',
  'jonah',
  'knox',
  'lucas',
  'malcolm',
  'nolan',
  'owen',
  'phineas',
  'quentrell',
  'raphael',
  'sullivan',
  'thorin',
  'ulysses',
  'vance',
  'winston',
  'xenon',
  'yuri',
  'zander',
  'amadeus',
  'beckett',
  'cormac',
  'dexter',
  'edmund',
  'florian',
  'griffin',
  'hendrick',
  'ignacio',
  'jaxon',
  'keegan',
  'leonidas',
  'marcel',
  'nigel',
  'orlando',
  'phelan',
  'quillon',
  'raphael',
  'sylvester',
  'theodore',
  'ulysses',
  'vaughn',
  'wyatt',
  'xavier',
  'yves',
  'zephyr',
  'archibald',
  'barnaby',
  'cassian',
  'daxton',
  'elric',
  'finley',
  'guy',
  'hendrix',
  'irving',
  'jax',
  'kai',
  'lachlan',
  'mortimer',
  'nico',
  'otis',
  'phoenix',
  'quentin',
  'ryker',
  'stefan',
  'teagan',
  'ulrich',
  'valentine',
  'wilder',
  'xenos',
  'yale',
  'zacharias',
  'ambrose',
  'blaise',
  'caspian',
  'darius',
  'emrys',
  'fletcher',
  'gareth',
  'huxley',
  'ian',
  'jaxton',
  'kellan',
  'lars',
  'montgomery',
  'nash',
  'orson',
  'phineas',
  'quinton',
  'rhys',
  'sawyer',
  'theon',
  'ulysses',
  'vander',
  'wesley',
  'xan',
  'yarrow',
  'zeke',
  'freyr',
  'balder',
  'sigurd',
  'gunnar',
  'bjorn',
  'erik',
  'leif',
  'magnus',
  'harald',
  'sven',
  'olaf',
  'rolf',
  'gunnar',
  'gorm',
  'hakon',
  'vidar',
  'hjalmar',
  'ulf',
  'finn',
  'jarl',
  'tyr',
  'viggo',
  'ivar',
  'jorgen',
  'rune',
  'vidar',
  'folke',
  'frode',
  'hagen',
  'einar',
  'stig',
  'vilhelm',
  'torsten',
  'axel',
  'rolf',
  'erling',
  'thorbjorn',
  'viggo',
  'vidar',
  'bard',
  'fridtjof',
  'hans',
  'knut',
  'lars',
  'mats',
  'ole',
  'rasmus',
  'sten',
  'trygve',
  'anders',
  'finn',
  'gustav',
  'ivar',
  'johan',
  'karl',
  'mikkel',
  'njal',
  'peder',
  'rune',
  'soren',
  'ulf',
  'viggo',
  'brendan',
  'cian',
  'darragh',
  'eamon',
  'fergus',
  'galen',
  'hagan',
  'ian',
  'kellan',
  'liam',
  'milo',
  'niall',
  'oisin',
  'padraig',
  'ronan',
  'seamus',
  'tadhg',
  'una',
  'angus',
  'callum',
  'dougal',
  'ewan',
  'finnian',
  'griffin',
  'hamish',
  'ivor',
  'kian',
  'lachlan',
  'malcolm',
  'nolan',
  'orrin',
  'padraig',
  'rohan',
  'shane',
  'tavish',
  'vaughn',
  'wylie',
  'xander',
  'yale',
  'zane'
];

const humanFemaleFirstNames = [
  'aella',
  'brynhildr',
  'cyra',
  'dagny',
  'elsa',
  'fiona',
  'gwen',
  'hilde',
  'ingrid',
  'johanna',
  'kira',
  'luna',
  'mira',
  'nora',
  'olivia',
  'piper',
  'quinn',
  'rhiannon',
  'sage',
  'thora',
  'ursula',
  'vivienne',
  'willa',
  'xanthe',
  'yara',
  'zara',
  'adelaide',
  'brigid',
  'clara',
  'diana',
  'elara',
  'freyja',
  'gia',
  'helena',
  'isadora',
  'juliet',
  'keira',
  'lilith',
  'maeve',
  'niamh',
  'ophelia',
  'penelope',
  'quintessa',
  'rosalind',
  'saoirse',
  'thea',
  'ulyssa',
  'vanessa',
  'wynn',
  'xena',
  'yasmin',
  'zelda',
  'april',
  'bethany',
  'calliope',
  'daisy',
  'eris',
  'fleur',
  'gemma',
  'hazel',
  'iris',
  'jade',
  'kenna',
  'lila',
  'mabel',
  'nova',
  'ophelia',
  'phoebe',
  'quinn',
  'raven',
  'seraphina',
  'talia',
  'umbria',
  'violet',
  'willow',
  'xandra',
  'yasmine',
  'zinnia',
  'anya',
  'bella',
  'carina',
  'daphne',
  'ella',
  'felicity',
  'gia',
  'hannah',
  'isla',
  'juno',
  'kaia',
  'luna',
  'mila',
  'nina',
  'olive',
  'piper',
  'astrid',
  'brienne',
  'cara',
  'dagna',
  'elva',
  'finola',
  'greta',
  'hilda',
  'inna',
  'jorunn',
  'kenna',
  'lilja',
  'maren',
  'nora',
  'orla',
  'ragna',
  'sigrun',
  'thora',
  'ulla',
  'vigdis',
  'wilma',
  'yrsa',
  'zara',
  'aoife',
  'briana',
  'cara',
  'deirdre',
  'elin',
  'freyja',
  'grainne',
  'helena',
  'iona',
  'jenna',
  'kiera',
  'liadan',
  'mairead',
  'niamh',
  'oona',
  'rhiannon',
  'saoirse',
  'teagan',
  'una',
  'vivian',
  'wynn',
  'xanthe',
  'ysolde',
  'zoe',
  'giulia',
  'sophia',
  'isabella',
  'chiara',
  'alessia',
  'elena',
  'lucia',
  'giada',
  'valentina',
  'francesca',
  'serena',
  'camilla',
  'alice',
  'elisa',
  'claudia',
  'anna',
  'veronica',
  'marta',
  'caterina',
  'maria',
  'giovanna',
  'marina',
  'roberta',
  'laura',
  'emilia',
  'matilde',
  'simona',
  'vittoria',
  'giorgina',
  'rita',
  'federica',
  'sara',
  'amelia',
  'loredana',
  'rosa',
  'valeria',
  'eleonora',
  'angelica',
  'carla',
  'beatrice',
  'emiliana',
  'patrizia',
  'alessandra',
  'fabrizia',
  'irene',
  'lucrezia',
  'maddalena',
  'sabrina',
  'sandra',
  'silvia',
  'tiziana',
  'silvana',
  'marzia',
  'giuliana',
  'roberta',
  'piera',
  'pamela',
  'rosetta',
  'romilda',
  'antonella',
  'cristina',
  'letizia',
  'tiziana',
  'vittoria',
  'zaira',
  'ida',
  'elsa',
  'edda',
  'greta',
  'gisella',
  'giuseppina',
  'amalia',
  'dora',
  'elisabetta',
  'ornella',
  'pina',
  'fiammetta',
  'ida',
  'marcella',
];
