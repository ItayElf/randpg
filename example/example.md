# Examples <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Generating names](#generating-names)
- [Generating npcs](#generating-npcs)
- [Generating locations\\buildings](#generating-locationsbuildings)
- [Generating settlements](#generating-settlements)
- [Generating landscapes](#generating-landscapes)
- [Generating deities](#generating-deities)
- [Generating guilds](#generating-guilds)
- [Generating worlds](#generating-worlds)

## Generating names

Generating a male halfling name as an example:

```dart
final Gender gender = Gender.male;
final Race race = Halfling();
final nameGenerator = race.getNameGenerator(gender);

// if you want to seed the generator:
nameGenerator.seed(1234);

print(nameGenerator.generate()); // expected output: "Cormin Shadowheart"
```
*output might be different since dart random seed is different on different machines* 

## Generating npcs

Generating an elf npc as an example:
```dart
final Race race = Elf();
final npcGenerator = NpcGenerator(race);

print(npcGenerator.generate());
```

## Generating locations\buildings

Generating a tavern whose owner is a dwarf as an example:
```dart
final LocationType locationType = Tavern();
final Race ownerRace = Dwarf();

final locationGenerator = LocationGenerator(locationType, ownerRace);
print(locationGenerator.generate());
```

## Generating settlements

Generating a town of mostly orcs as an example:
```dart
final SettlementType settlementType = Town();
final Race dominantRace = Orc();

final settlementGenerator = SettlementGenerator(settlementType, dominantRace);
print(settlementGenerator.generate());
```

## Generating landscapes

Generating a swamp as an example:
```dart
final LandscapeType landscapeType = Swamp();

final landscapeGenerator = LandscapeGenerator(landscapeType);
print(landscapeGenerator.generate());
```

## Generating deities

Generating a lawful good god/goddess as an example:
```dart
final Alignment alignment = Alignment(
  ethical: EthicalAlignment.lawful,
  moral: MoralAlignment.good,
);
final DeityType deityType = God();

final deityGenerator = DeityGenerator(deityType, alignment);
print(deityGenerator.generate());
```

## Generating guilds

Generating a thieves guild as an example:
```dart
final GuildType guildType = ThievesGuild();
final guildGenerator = GuildGenerator(guildType);

final Guild guild = guildGenerator.generate();
print(guild);
```

## Generating worlds

Generating a world with the default settings
```dart
final WorldSettings settings = DefaultWorldSettings();
final worldGenerator = WorldGenerator(settings);

final World world = worldGenerator.generate();
print(world);
```