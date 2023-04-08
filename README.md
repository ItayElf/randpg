# Randpg <!-- omit in toc -->

[![version](https://img.shields.io/badge/version-0.5.0-green.svg)](https://semver.org)

Randpg is a package for generating random rpg entities like npcs, settlements and even worlds.

*This package is still in development and some versions might not be backwards compatible before v1.0.0.*

To view the changelog, [click here](./CHANGELOG.md)

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
- [Features](#features)
- [Goals](#goals)
  - [In the Future](#in-the-future)
- [Usage](#usage)
  - [Generating names](#generating-names)
  - [Generating npcs](#generating-npcs)
  - [Generating locations\\buildings](#generating-locationsbuildings)
  - [Generating settlements](#generating-settlements)
  - [Generating landscapes](#generating-landscapes)
  - [Generating deities](#generating-deities)

## Installation

Follow the installation instructions on dart packages.

## Features

* Generating names for various races
* Generate npc data:
  * Physical description
  * Personality generator

## Goals

- World generator
- Waypoint Generator
  
### In the Future

- Companion Generator
- Holiday Generator

## Usage

*For detailed examples check the [examples folder](./example/)*

### Generating names

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

### Generating npcs

Generating an elf npc as an example:
```dart
final Race race = Elf();
final npcGenerator = NpcGenerator(race);

print(npcGenerator.generate());
```

### Generating locations\buildings

Generating a tavern whose owner is a dwarf as an example:
```dart
final LocationType locationType = Tavern();
final Race ownerRace = Dwarf();

final locationGenerator = LocationGenerator(locationType, ownerRace);
print(locationGenerator.generate());
```

### Generating settlements

Generating a town of mostly orcs as an example:
```dart
final SettlementType settlementType = Town();
final Race dominantRace = Orc();

final settlementGenerator = SettlementGenerator(settlementType, dominantRace);
print(settlementGenerator.generate());
```

### Generating landscapes

Generating a swamp as an example:
```dart
final LandscapeType landscapeType = Swamp();

final landscapeGenerator = LandscapeGenerator(landscapeType);
print(landscapeGenerator.generate());
```

### Generating deities

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