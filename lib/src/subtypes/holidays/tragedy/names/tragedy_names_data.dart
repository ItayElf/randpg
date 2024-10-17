const tragedyNouns = [
  'abandoned dreams',
  'abandoned places',
  'betrayed trust',
  'broken bonds',
  'broken dreams',
  'broken promises',
  'burdened minds',
  'burdened spirits',
  'buried hopes',
  'buried secrets',
  'clouded thoughts',
  'crushed aspirations',
  'crushed dreams',
  'cursed lands',
  'deferred dreams',
  'desolate fields',
  'disheartened souls',
  'dismantled lives',
  'displaced communities',
  'distant ancestors',
  'distant dreams',
  'drowned voices',
  'eclipsed joys',
  'empty chairs',
  'empty promises',
  'endangered species',
  'endless regrets',
  'faded glories',
  'faded laughter',
  'faded love',
  'faded wishes',
  'fallen angels',
  'fallen comrades',
  'fallen heroes',
  'fleeting moments',
  'forgotten faces',
  'forgotten heroes',
  'forgotten joys',
  'forgotten legends',
  'forgotten memories',
  'forgotten places',
  'forgotten songs',
  'forgotten sorrows',
  'forsaken homes',
  'frozen smiles',
  'grieving families',
  'grim realities',
  'haunted dreams',
  'haunted memories',
  'haunted pasts',
  'haunted tales',
  'hidden griefs',
  'ignored pleas',
  'lingering shadows',
  'longing hearts',
  'lost causes',
  'lost children',
  'lost connections',
  'lost friendships',
  'lost futures',
  'lost identities',
  'lost loves',
  'lost opportunities',
  'lost paths',
  'lost potential',
  'misguided paths',
  'missing pieces',
  'muffled laughter',
  'neglected spaces',
  'overlooked sacrifices',
  'painful truths',
  'sad realities',
  'shadowed hopes',
  'shattered families',
  'shattered hopes',
  'shattered illusions',
  'shattered lives',
  'shrouded histories',
  'silent battles',
  'silent cries',
  'silent graves',
  'sorrowful days',
  'sorrowful souls',
  'torn hearts',
  'troubled waters',
  'unacknowledged pain',
  'uncertain futures',
  'unfulfilled dreams',
  'unrecognized struggles',
  'unsaid goodbyes',
  'unseen sacrifices',
  'unseen tears',
  'unspoken griefs',
  'unspoken words',
  'unsung heroes',
  'untimely departures',
  'untold stories',
  'unwritten stories',
  'vanished hopes',
  'vanished lives',
  'vanished moments',
  'wandering spirits',
  'wasted opportunities',
  'worn out dreams',
  'wounded hearts'
];

const tragedyTime = [
  "day",
  "week",
  "night",
  "month",
  "season",
  "hour",
  "evening",
];

const tragedyEmotionWords = [
  'absence',
  'affliction',
  'anguish',
  'anguished thought',
  'bitterness',
  'bleakness',
  'contemplation',
  'darkness',
  'dejection',
  'desolation',
  'despair',
  'disappointment',
  'discomfort',
  'discontent',
  'disillusionment',
  'dismay',
  'disquiet',
  'distress',
  'dolefulness',
  'doubt',
  'downheartedness',
  'fatefulness',
  'forlornness',
  'grief',
  'grief-stricken',
  'grieving',
  'heartache',
  'heartbreak',
  'heaviness',
  'heavy soul',
  'heavy-heartedness',
  'hopelessness',
  'lamentation',
  'lonesomeness',
  'longing',
  'loss',
  'lost love',
  'melancholy',
  'mourners',
  'mourning',
  'nostalgia',
  'pain',
  'painful recollection',
  'painfulness',
  'pensive thoughts',
  'pensiveness',
  'pity',
  'reflection',
  'regret',
  'remembrance',
  'remorse',
  'remorsefulness',
  'restlessness',
  'retrospection',
  'sad recollection',
  'sad refrain',
  'sad song',
  'sadness',
  'shadow',
  'solemnity',
  'solitude',
  'sombre reflection',
  'sorrow',
  'sorrowful reflection',
  'sorrowfulness',
  'suffering',
  'tearfulness',
  'tears',
  'torment',
  'tragedy',
  'tristfulness',
  'unhappiness',
  'wailing',
  'weariness',
  'weeping',
  'wistfulness',
  'wretchedness',
  'yearning'
];

const tragedyActions = [
  'ache',
  'bear sorrow',
  'bear witness',
  'beg',
  'bleed',
  'breathe',
  'burn incense',
  'carry grief',
  'cast away joy',
  'chant',
  'chant in sorrow',
  'chant quietly',
  'commemorate',
  'contemplate',
  'cry',
  'curse',
  'despair',
  'dwell',
  'embrace shadows',
  'endure',
  'fast',
  'fight',
  'gather silently',
  'gaze',
  'grasp memories',
  'grieve',
  'hold vigil',
  'honor',
  'honor quietly',
  'journey alone',
  'kneel',
  'lament',
  'light a flame',
  'light candles',
  'long',
  'look back',
  'lower heads',
  'meditate',
  'mourn',
  'offer',
  'offer songs',
  'pause',
  'plead',
  'ponder deeply',
  'pray',
  'proclaim sorrow',
  'quiver',
  'rage',
  'raise hands',
  'recall',
  'reflect',
  'reflect silently',
  'release pain',
  'relive memories',
  'remain',
  'remember',
  'renounce',
  'sacrifice',
  'sacrifice deeply',
  'scatter flowers',
  'scream',
  'search',
  'seek',
  'send blessings',
  'share stories',
  'shield hearts',
  'sigh',
  'silently plead',
  'sing',
  'sit in silence',
  'speak prayers',
  'speak softly',
  'spill tears',
  'stand vigil',
  'struggle',
  'struggle silently',
  'suffer',
  'surrender',
  'take oaths',
  'tell stories',
  'testify',
  'travel',
  'tremble',
  'vow',
  'wail',
  'wait',
  'wait patiently',
  'walk in silence',
  'wander',
  'wander far',
  'weep',
  'whisper',
  'whisper farewell',
  'whisper names',
  'whisper oaths',
  'whisper prayers',
  'withdraw',
  'withdraw quietly',
  'write',
  'write poems',
  'yearn'
];

const tragedyMythNouns = [
  'ashes',
  'bane',
  'beacon',
  'beast',
  'blessing',
  'bone',
  'bones',
  'breath',
  'cave',
  'chalice',
  'chant',
  'charm',
  'cloak',
  'covenant',
  'crown',
  'curse',
  'darkness',
  'death',
  'demons',
  'dream',
  'echo',
  'echoes',
  'eclipse',
  'fangs',
  'favor',
  'fire',
  'flesh',
  'flood',
  'footsteps',
  'fury',
  'gaze',
  'gift',
  'glory',
  'grace',
  'grave',
  'guardian',
  'hand',
  'heart',
  'herald',
  'horn',
  'hunger',
  'hymn',
  'idol',
  'keeper',
  'lament',
  'legends',
  'light',
  'mantle',
  'mark',
  'mercy',
  'myths',
  'oath',
  'omens',
  'oracle',
  'pact',
  'phantom',
  'plague',
  'power',
  'prophecy',
  'rage',
  'relic',
  'riddle',
  'rites',
  'roots',
  'ruins',
  'savior',
  'scourge',
  'scroll',
  'seal',
  'secret',
  'serpent',
  'shadow',
  'shield',
  'sigil',
  'song',
  'spear',
  'specter',
  'spell',
  'spirits',
  'storm',
  'sword',
  'tears',
  'throne',
  'tide',
  'tomb',
  'torch',
  'trial',
  'veil',
  'vision',
  'visions',
  'voice',
  'warden',
  'whisper',
  'will',
  'wings',
  'wisdom',
  'wraith',
  'wrath'
];

const tragedyMyths = [
  'the ancient ones',
  'the ancient stars',
  'the blackened sun',
  'the blackened veil',
  'the bleeding heart',
  'the broken chalice',
  'the broken dawn',
  'the broken heart',
  'the broken oath',
  'the broken seal',
  'the broken spear',
  'the broken stone',
  'the broken wings',
  'the burning heart',
  'the burning sky',
  'the crimson dawn',
  'the cursed path',
  'the cursed ring',
  'the cursed stone',
  'the cursed wind',
  'the distant echoes',
  'the dying ember',
  'the endless grief',
  'the endless journey',
  'the endless sorrow',
  'the endless void',
  'the eternal flame',
  'the eternal night',
  'the fading light',
  'the fallen grace',
  'the fallen star',
  'the fallen warrior',
  'the forbidden flame',
  'the forbidden knowledge',
  'the forgotten',
  'the forgotten flame',
  'the forgotten king',
  'the forgotten name',
  'the forgotten rite',
  'the forgotten sea',
  'the forgotten souls',
  'the forgotten tomb',
  'the forgotten truth',
  'the forsaken',
  'the forsaken dream',
  'the forsaken love',
  'the forsaken ones',
  'the forsaken realm',
  'the forsaken vows',
  'the forsaken warrior',
  'the frozen heart',
  'the haunted whispers',
  'the hidden shadow',
  'the hidden truth',
  'the lost ages',
  'the lost child',
  'the lost empire',
  'the lost horizon',
  'the lost kingdom',
  'the lost path',
  'the lost prophecy',
  'the lost relic',
  'the lost souls',
  'the nameless',
  'the nameless hero',
  'the nameless queen',
  'the ruined past',
  'the ruined temple',
  'the sacred bond',
  'the sacred fire',
  'the sacred silence',
  'the sacred tree',
  'the shadowed grove',
  'the shadowed past',
  'the shattered chains',
  'the shattered crown',
  'the shattered hope',
  'the shattered mirror',
  'the shattered relic',
  'the shattered sword',
  'the silent echoes',
  'the silent gods',
  'the silent lament',
  'the silent storm',
  'the silver veil',
  'the sunken city',
  'the sunken throne',
  'the twisted fate',
  'the unbroken chains',
  'the unseen storm',
  'the unseen tears',
  'the veiled moon',
  'the veiled truth',
  'the wandering spirits'
];
