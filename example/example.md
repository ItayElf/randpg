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
- [Generating Emblems](#generating-emblems)
- [Generating worlds](#generating-worlds)

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

## Generating kingdoms

Generating a republic of dwarfs as an example:
```dart
final GovernmentType governmentType = Republic();
final Race race = Dwarf();
final KingdomType kingdomType = DefaultKingdomType();

final Kingdom kingdom = KingdomGenerator(kingdomType, race, governmentType).generate();
print(kingdom);
```

## Generating Emblems

Generating an emblem with the default type:
```dart
final EmblemType type = DefaultEmblemType();
final emblemGenerator = EmblemGenerator(type);

emblemGenerator.seed(3979);

final Emblem emblem = emblemGenerator.generate();
print(emblem.buildSvg());
```

Expected results:

<svg width="120.25" height="150" viewBox="0 0 120.25 150" fill="none" xmlns="http://www.w3.org/2000/svg"><g> <mask id="b" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"><svg width="120.25" height="150" viewBox="0 0 49.745 56.58" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"> <path style="fill:#000;stroke-width:.0766568" d="m-153.714 91.33.044 22.702c0 7.768 2.977 15.618 9.073 20.76 15.552 13.121-.043.018 15.444 13.119h.027c.096-.024.19-.05.284-.075V97.088l-12.291-1.664-12.38-4.093zm49.745 0-.045 22.702c0 7.768-2.976 15.618-9.072 20.76-15.552 13.121.043.018-15.444 13.119h-.028c-.095-.024-.19-.05-.284-.075V97.088l12.292-1.664 12.38-4.093z" class="UnoptimicedTransforms" transform="translate(153.715 -91.331)" /></svg></mask><g mask="url(#b)"> <svg width="120.25" height="150" viewBox="0 0 49.477 61.325" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"> <path style="fill:hsl(173, 25%, 25%);stroke-width:.824566;paint-order:markers stroke fill" d="M-620.184 142.317h49.339V80.992h-49.339z" transform="translate(620.184 -80.992)" /> <path style="fill:hsl(293, 22%, 29%);stroke-width:.264583" d="M-620.183 132.406v-9.911l12.353-15.362 12.353-15.362.257.085.256.086 12.123 15.067 12.122 15.067.006 9.96.006 9.96-.418.16-.419.161h-48.64z" transform="translate(620.184 -80.992)" /> <path style="fill:hsl(173, 25%, 25%);stroke-width:.823972;paint-order:markers stroke fill" d="m-745.802 168.674 22.938 36.091v-36.091zm45.876 0-22.938 36.091v-36.091z" transform="matrix(-1.07498 0 0 -.84799 -752.405 204.242)" class="UnoptimicedTransforms" /></svg></g><svg y="35.0" x="20.0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="80.0" width="80.0"><path d="M329.2 317.16c-3 82.09-78.09 146-78.09 146L192 439.73c-27.57-11-37.86-28.56-50.31-55.49l-.06-.12 94.49 27.2-57.73-27.64c-41.53-19.88-58.87-47.12-76.76-89.55l134.47 52-126.2-76.23c-28.67-17.32-37.15-36.68-51.25-67.06l161.16 68.74-79-51.51C55.6 166.5 47.95 135.26 18.88 72.57l181 113.86c51.5 32.38 131.55 69.93 129.32 130.73zM493.12 216.5c0 6.87-17.51 20.85-20.35 20.62-3.7-.31-46.27-27.85-61.93-35.68-15-7.49-59.39 1.27-64.19-42.81-11 28 10.77 90.21 27.84 120.18 35.42 62.17-25.71 146.59-101.8 186A304.54 304.54 0 0 0 302 430.4a252.08 252.08 0 0 0 28.5-49.52c9-21.2 14-42.44 14.73-63.13a85.52 85.52 0 0 0-10.78-44.35c-6.49-12-15.74-23.4-28.28-34.93-21.84-20.09-50-36.91-74.92-51.74l-1.16-.69c-5.83-11-8.63-21.26-4.81-29.76 26.71-59.41 100.93-93.52 166.18-86.86 21.2-25.48 41.89-22.08 41.89-22.08l-11.9 25.33s20-11.19 23.11-7.29l-16.48 30.7L442 114.61s51.12 95.57 51.12 101.89zm-73.8-99.92a9.47 9.47 0 1 0-9.47 9.47 9.47 9.47 0 0 0 9.48-9.48z" fill="hsl(53, 82%, 76%)" fill-opacity="1"></path></svg></g></svg>



## Generating worlds

Generating a world with the default settings:
```dart
final WorldSettings settings = DefaultWorldSettings();
final worldGenerator = WorldGenerator(settings);

final World world = worldGenerator.generate();
print(world);
```