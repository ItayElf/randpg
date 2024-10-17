# Examples <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Generating names](#generating-names)
- [Generating npcs](#generating-npcs)
- [Generating locations\\buildings](#generating-locationsbuildings)
- [Generating settlements](#generating-settlements)
- [Generating landscapes](#generating-landscapes)
- [Generating deities](#generating-deities)
- [Generating guilds](#generating-guilds)
- [Generating kingdoms](#generating-kingdoms)
- [Generating emblems](#generating-emblems)
- [Generating worlds](#generating-worlds)
- [Generating companions](#generating-companions)
- [Generating holidays](#generating-holidays)
- [Generate world map](#generate-world-map)

## Generating names

Generating a male halfling name as an example:

```dart
final Gender gender = Gender.male;
final Race race = Halfling();
final nameGenerator = race.getNameGenerator(gender);

// if you want to seed the generator:
nameGenerator.seed(1234);

print(nameGenerator.generate()); // expected output: "Cormin Copperbrook"
```

_output might be different since dart random seed is different on different machines_

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

## Generating kingdoms

Generating a republic of dwarfs as an example:

```dart
final GovernmentType governmentType = Republic();
final Race race = Dwarf();
final KingdomType kingdomType = DefaultKingdomType();

final Kingdom kingdom = KingdomGenerator(kingdomType, race, governmentType).generate();
print(kingdom);
```

## Generating emblems

Generating an emblem with the default type:

```dart
final EmblemType type = DefaultEmblemType();
final emblemGenerator = EmblemGenerator(type);

emblemGenerator.seed(3979);

final Emblem emblem = emblemGenerator.generate();
print(emblem.buildSvg());
```

Expected results:

![expected output](https://raw.githubusercontent.com/ItayElf/randpg/refs/heads/main/example/emblem.svg)

## Generating worlds

Generating a world with the default settings:

```dart
final WorldSettings settings = DefaultWorldSettings();
final worldGenerator = WorldGenerator(settings);

final World world = worldGenerator.generate();
print(world);
```

## Generating companions

Generating a dog companion as an example:

```dart
final CompanionType companionType = Dog();
final Gender gender = Gender.female;
final companionGenerator = CompanionGenerator(companionType, gender);

print(companionGenerator.generate());
```

## Generating holidays

```dart
final HolidayType holidayType = Celebration();
final holidayGenerator = HolidayGenerator(holidayType);

print(holidayGenerator.generate());
```

## Generate world map

```dart
final WorldMapSettings worldMapSettings = IslandsWorldMapSettings();
final worldMapGenerator = WorldMapGenerator(worldMapSettings, 100, 100);
worldMapGenerator.seed(1664)

final worldMap = worldMapGenerator.generate();
print(worldMap.toMap()["image"]) // Prints the image as base64
```

Expected results:

![expected output](https://raw.githubusercontent.com/ItayElf/randpg/refs/heads/main/example/island_setting.png)
