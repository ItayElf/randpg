const tavernBeverageNamePrefix = [
  'abyssal',
  'acidic',
  'angry',
  'anxious',
  'arcane',
  'babbling',
  'bear and',
  'bell and',
  'bitter',
  'black',
  'blackened',
  'blade and',
  'blind',
  'block and',
  'bloodied',
  'bloodstained',
  'bloody',
  'bludgeoning',
  'blue',
  'blushing',
  'bony',
  'book and',
  'boot and',
  'brass',
  'brave',
  'broken',
  'bronze',
  'brown',
  'bubbly',
  'bull and',
  'burnt',
  'carnelian',
  'carved',
  'cat and',
  'celestial',
  'chalk',
  'chaotic',
  'charging',
  'charmed',
  'charming',
  'cloth',
  'concussive',
  'copper',
  'cowardly',
  'crimson',
  'crying',
  'crystal',
  'dancing',
  'dark',
  'deadly',
  'deaf',
  'demonic',
  'depressed',
  'devilish',
  'diamond',
  'dire',
  'dirty',
  'disfigured',
  'dog and',
  'draconic',
  "dragon's",
  'drunken',
  'dueling',
  'dull',
  'ecstatic',
  'electrum',
  'emerald',
  'energetic',
  'excited',
  'exhausted',
  'fevered',
  'fiendish',
  'fighting',
  'filthy',
  'fish and',
  'flaming',
  'flirty',
  'flying',
  'forceful',
  'forged',
  'forgotten',
  'fractured',
  'frightened',
  'frightening',
  'fuchsia',
  'gambling',
  'giant',
  'gilded',
  'glass',
  'gnarled',
  'goat and',
  'gold',
  'golden',
  'grappled',
  'green',
  'grey',
  'hammered',
  'happy',
  'hawk and',
  'hidden',
  'hollow',
  'holy',
  'hook and',
  'hoppy',
  'horrific',
  'horse and',
  'hungry',
  'icy',
  'impatient',
  'incapacitated',
  'indigo',
  'infernal',
  'invisible',
  'iron',
  'jade',
  'jagged',
  'joyful',
  'jumping',
  'keen',
  'knotted',
  'laughing',
  'lavender',
  'lawful',
  'lawless',
  'leaping',
  'little',
  'lonely',
  'lost',
  'loveless',
  'lovely',
  'lucky',
  'maimed',
  'marroon',
  'mauve',
  'meady',
  'metal',
  'miniature',
  'misshapen',
  'moldy',
  'monstrous',
  'moose and',
  'mossy',
  'mug and',
  'musty',
  'mutated',
  'necrotic',
  'nervous',
  'old',
  'one-eyed',
  'orange',
  'orderly',
  'overgrown',
  'overweight',
  'paralyzed',
  'petrified',
  'piercing',
  'pink',
  'pious',
  'platinum',
  'poisoned',
  'poisonous',
  'polished',
  'priceless',
  'prone',
  'psychic',
  'puce',
  'purple',
  'radiant',
  'raging',
  'rancid',
  'red',
  'rested',
  'restless',
  'restrained',
  'rogue',
  'rose and',
  'ruby',
  'rusty',
  'sad',
  'sapphire',
  'screaming',
  'sculpted',
  'shattered',
  'shining',
  'sickly',
  'silk',
  'silver',
  'skinny',
  'slashing',
  'sleeping',
  'smallest',
  'smiling',
  'soiled',
  'sour',
  'spotless',
  'spotted',
  'staff and',
  'steel',
  'stick and',
  'struggling',
  'stuffy',
  'stumbling',
  'stunned',
  'stunning',
  'sultry',
  'surly',
  'sweet',
  'tangled',
  'tangy',
  'teal',
  'thirsty',
  'tiny',
  'toasted',
  'tooth and',
  'toothless',
  'tranquil',
  'turquoise',
  'twisted',
  'unconscious',
  'unholy',
  'unlucky',
  'unsoiled',
  'vampiric',
  'velvet',
  'verdant',
  'violent',
  'violet',
  'wand and',
  'white',
  'wicked',
  'winged',
  'wise',
  'wolf and',
  'wooden',
  'woodland',
  'wounded',
  'yawning',
  'yellow',
  'zombified'
];

const tavernBeverageNameSuffix = [
  'abacus',
  'aboleth',
  'alligator',
  'angel',
  'ankheg',
  'anvil',
  'ape',
  'apple',
  'archon',
  'arrow',
  'artichoke',
  'axe',
  'baboon',
  'badger',
  'balor',
  'banshee',
  'barbarian',
  'bard',
  'barrel',
  'basilisk',
  'basket',
  'bat',
  'battleaxe',
  'beacon',
  'bear',
  'beech',
  'behir',
  'bell',
  'birch',
  'blade',
  'blanket',
  'blowgun',
  'boar',
  'boat',
  'bolt',
  'book',
  'boot',
  'bottle',
  'bow',
  'bucket',
  'bugbear',
  'bulette',
  'bull',
  'camel',
  'candle',
  'cardinal',
  'carrot',
  'cart',
  'cat',
  'centaur',
  'chain',
  'cherry',
  'chest',
  'chimera',
  'circle',
  'claw',
  'cleric',
  'cloak',
  'cloaker',
  'clover',
  'club',
  'coat',
  'cockatrice',
  'coin',
  'couatl',
  'cow',
  'crab',
  'crocodile',
  'crossbow',
  'crow',
  'crowbar',
  'crown',
  'crystal',
  'cube',
  'cup',
  'cyclops',
  'dagger',
  'dart',
  'deer',
  'demon',
  'devil',
  'dog',
  'donkey',
  'door',
  'doppelganger',
  'dove',
  'dragon',
  'drider',
  'drow',
  'druid',
  'drum',
  'dryad',
  'duergar',
  'dulcimer',
  'dwarf',
  'eagle',
  'edge',
  'elemental',
  'elephant',
  'elf',
  'elk',
  'ettercap',
  'ettin',
  'eye',
  'fiend',
  'fighter',
  'fish',
  'fist',
  'flail',
  'flask',
  'flower',
  'flute',
  'foot',
  'forest',
  'frog',
  'fungus',
  'gargoyle',
  'gauntlet',
  'genie',
  'ghost',
  'ghoul',
  'giant',
  'glaive',
  'glass',
  'glove',
  'gnoll',
  'gnome',
  'goat',
  'goblin',
  'golem',
  'goliath',
  'gorgon',
  'grape',
  'grick',
  'griffon',
  'grove',
  'hag',
  'halberd',
  'halfling',
  'hammer',
  'handaxe',
  'harpy',
  'hawk',
  'head',
  'heart',
  'hex',
  'hippogriff',
  'hoard',
  'hobgoblin',
  'homunculus',
  'horn',
  'horse',
  'hound',
  'hourglass',
  'human',
  'hydra',
  'hyena',
  'imp',
  'incubus',
  'island',
  'ivy',
  'jackal',
  'jackdaw',
  'jacket',
  'javelin',
  'jay',
  'jelly',
  'jug',
  'king',
  'kobold',
  'kraken',
  'ladder',
  'lamia',
  'lamp',
  'lance',
  'lantern',
  'lemon',
  'lich',
  'line',
  'lion',
  'lizard',
  'lizardfolk',
  'lock',
  'lute',
  'lycanthrope',
  'lyre',
  'mace',
  'mage',
  'magmin',
  'magpie',
  'mammoth',
  'manticore',
  'map',
  'maple',
  'mare',
  'maul',
  'maw',
  'medusa',
  'melon',
  'mephit',
  'mermaid',
  'mimic',
  'minotaur',
  'monk',
  'moose',
  'morningstar',
  'mouth',
  'mug',
  'mule',
  'mummy',
  'mystic',
  'naga',
  'nail',
  'net',
  'nightmare',
  'nose',
  'noose',
  'oak',
  'octopus',
  'ogre',
  'ooze',
  'orb',
  'orc',
  'otyugh',
  'owl',
  'owlbear',
  'paladin',
  'panther',
  'pear',
  'pegasus',
  'pen',
  'pick',
  'pigeon',
  'pike',
  'pit',
  'pitcher',
  'pixie',
  'plate',
  'polyhedral',
  'pomegranate',
  'pony',
  'pot',
  'pouch',
  'pudding',
  'queen',
  'quill',
  'quiver',
  'rakshasa',
  'ram',
  'ranger',
  'rapier',
  'rat',
  'raven',
  'reprieve',
  'respite',
  'rest',
  'revenant',
  'rhinoceros',
  'ring',
  'robe',
  'robin',
  'roc',
  'rogue',
  'rope',
  'rose',
  'rust monster',
  'sack',
  'sahuagin',
  'sailor',
  'salamander',
  'sanctuary',
  'sanctum',
  'satyr',
  'scabbard',
  'scimitar',
  'scorpion',
  'scroll',
  'scythe',
  'sea',
  'serpent',
  'shadow',
  'shark',
  'shawm',
  'ship',
  'shovel',
  'sickle',
  'sledge',
  'sling',
  'slumber',
  'snake',
  'sorcerer',
  'spear',
  'specter',
  'spellbook',
  'sphere',
  'sphinx',
  'spider',
  'sprite',
  'square',
  'squirrel',
  'staff',
  'stallion',
  'stirge',
  'stone',
  'succubus',
  'sword',
  'tackle',
  'tail',
  'tankard',
  'tarrasque',
  'tent',
  'thicket',
  'tiefling',
  'tiger',
  'tome',
  'tooth',
  'torch',
  'totem',
  'trap',
  'trapezoid',
  'treant',
  'tree',
  'triangle',
  'trident',
  'troll',
  'trombone',
  'trumpet',
  'turtle',
  'unicorn',
  'vampire',
  'vulture',
  'wagon',
  'wand',
  'warhammer',
  'warlock',
  'warrior',
  'weasel',
  'werewolf',
  'whale',
  'whip',
  'whistle',
  'wight',
  "will-o'-wisp",
  'wizard',
  'wolf',
  'worm',
  'wraith',
  'wyrm',
  'wyvern',
  'yak',
  'yeti',
  'zombie'
];

const tavernRedWineTypes = [
  'shiraz',
  'merlot',
  'cabernet Sauvignon',
  'pinot noir'
];

const tavernWhiteWineTypes = [
  'riesling',
  'gewürztraminer',
  'chardonnay',
  'sauvignon blanc'
];

const tavernWineOrigin = {
  " bottom-shelf": 0.5,
  " poorly made": 1,
  " house-made": 3,
  " locally produced": 2,
  "n imported": 3,
  " finely made": 4,
  " famous vintage of": 5,
};

const tavernWineBouquet = [
  "with a bouquet that is",
  "with a taste that is",
  "that is described as",
  "with flavors that are",
];

const tavernWineDescription = [
  "astringent",
  "musty",
  "vinegary",
  "sour",
  "cloying",
  "corked",
  "tart",
  "dirty",
  "raisiny",
  "rough",
  "bitter",
  "flat",
  "smokey",
  "leathery",
  "green",
  "lean",
  "dry",
  "full",
  "powerful",
  "earthy",
  "sweet",
  "oaky",
  "mellow",
  "spicy",
  "herbaceous",
  "deep",
  "toasty",
  "vibrant",
  "crisp",
  "soft",
  "buttery",
  "aromatic",
  "expressive",
  "fruity",
  "smooth",
  "complex",
  "rich",
];

const tavernBeerType = [
  "lager",
  "cider",
  "fruit ale",
  "ale",
  "pilsner",
  "malt",
  "porter",
  "stout",
];

const tavernBeerOrigin = {
  " poorly brewed": 1,
  " house-brewed": 3,
  " microbrewed": 3,
  " locally brewed": 2,
  "n imported": 4,
  " masterfully brewed": 5,
};

const tavernBeerColor = [
  "light",
  "pale",
  "light amber",
  "golden",
  "amber",
  "reddish",
  "light brown",
  "copper-colored",
  "dark amber",
  "medium brown",
  "brown",
  "chestnut brown",
  "dark brown",
  "blackish",
];

const tavernBeerFlavor = [
  "n astringent",
  " bitter",
  " dry",
  " sour",
  " mild",
  " sweet",
  " spicy",
  " pleasantly bitter",
  " complex",
  " nutty",
  " full-bodied",
  " refreshing",
  " fruity",
  " robust",
  " crisp",
  "rich",
];

const tavernBeerFinish = [
  "sour",
  "rough",
  "bitter",
  "creamy",
  "sweet",
  "smooth",
  "pleasant",
  "rich",
];

const tavernCookingMethods = [
  "stewed",
  "baked",
  "deep-fried",
  "roasted",
  "grilled",
  "blackened",
  "rotisserie-cooked",
  "pan-fried",
  "herb-crusted",
  "braised",
  "pan-seared",
  "stir-fried",
];

const tavernMeats = {
  "mystery meat": 5,
  "sausage": 3,
  "rabbit": 2,
  "chicken": 2,
  "fish": 3,
  "pork": 4,
  "lamb": 4,
  "turkey": 2,
  "beef": 4,
  "frog": 1,
  "venison": 4,
  "steak": 5,
  "duck": 2,
  "veal": 4,
  "squab": 2,
  "pheasant": 2,
  "quail": 2,
};

const tavernFoodSauce = [
  "in a thick gravy",
  "in a cream sauce",
  "in white sauce",
  "in red sauce",
  "with a ginger marinade",
  "in garlic sauce",
  "",
];

const tavernFoodPresentation = [
  "served over",
  "on a bed of",
  "served with",
  "alongside",
];

const tavernFoodSide = [
  "bread",
  "mashed potatoes",
  "rice",
  "noodles",
  "pasta",
  "quinoa",
];